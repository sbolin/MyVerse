//
//  VerseViewModel.swift
//  MyVerseLookup
//
//  Created by Scott Bolin on 21-Sep-21.
//

import Combine
import SwiftUI

final class VerseViewModel: ObservableObject {

    @Published var bibleVerse: [BibleVerse] = [] // only 1 verse returned
    @Published var verseField = ""
    @Published var verseValid = false
    @Published var parsedVerse = Verse()
    @Published private(set) var debounced = ""

    private var subscriber: AnyCancellable?
    private var cancellable = Set<AnyCancellable>()

    // base url for verse lookup
    private let baseURL = "https://labs.bible.org/api/?passage="

    // verse and regex for checking/breaking apart verse
    private let versePattern = #"(?<fullVerse>(?<bookID>(?>I+|1st|2nd|3rd|First|Second|Third|[123]))? ?(?<book>Gen|Ge|Gn|Exo|Ex|Exod|Lev|Le|Lv|Num|Nu|Nm|Nb|Deut|Dt|Josh|Jos|Jsh|Judg|Jdg|Jg|Jdgs|Rth|Ru|Sam|Samuel|Kings|Kgs|Kin|Chron|Chronicles|Ezra|Ezr|Neh|Ne|Esth|Es|Job|Job|Jb|Pslm|Ps|Psalms|Psa|Psm|Pss|Prov|Pr|Prv|Eccles|Ec|Song|So|Canticles|Song of Songs|SOS|Isa|Is|Jer|Je|Jr|Lam|La|Ezek|Eze|Ezk|Dan|Da|Dn|Hos|Ho|Joel|Joe|Jl|Amos|Am|Obad|Ob|Jnh|Jon|Micah|Mic|Nah|Na|Hab|Zeph|Zep|Zp|Haggai|Hag|Hg|Zech|Zec|Zc|Mal|Mal|Ml|Matt|Mt|Mrk|Mk|Mr|Luk|Lk|John|Jn|Jhn|Acts|Ac|Rom|Ro|Rm|Co|Cor|Corinthians|Gal|Ga|Ephes|Eph|Phil|Php|Col|Col|Th|Thes|Thess|Thessalonians|Ti|Tim|Timothy|Titus|Tit|Philem|Phm|Hebrews|Heb|James|Jas|Jm|Pe|Pet|Pt|Peter|Jn|Jo|Joh|Jhn|John|Jude|Jud|Rev|The Revelation|Genesis|Exodus|Leviticus|Numbers|Deuteronomy|Joshua|Judges|Ruth|Samuel|Kings|Chronicles|Ezra|Nehemiah|Esther|Job|Psalms|Psalm|Proverbs|Ecclesiastes|Song of Solomon|Isaiah|Jeremiah|Lamentations|Ezekiel|Daniel|Hosea|Joel|Amos|Obadiah|Jonah|Micah|Nahum|Habakkuk|Zephaniah|Haggai|Zechariah|Malachi|Matthew|Mark|Luke|John|Acts|Romans|Corinthians|Galatians|Ephesians|Philippians|Colossians|Thessalonians|Timothy|Titus|Philemon|Hebrews|James|Peter|John|Revelation) (?<chapter>\d+)?:?(?<verse>\d+)?-?(?<endVerse>\d+)?)"#

    var versePrompt: String {
        verseValid ? "" : "Verse is in an unknown format, please try again"
    }

    /// parse verse and put components into verse[] struct. This will be used in creating a URL to provide to API. verseValid updated as appropriate.
    init() {
        $verseField
            .debounce(for: 0.5, scheduler: DispatchQueue.main)
            .removeDuplicates()
            .assign(to: &$debounced)
//        validateVerse()
    }

    /// Check validity of input search term, update verseValid as appropriate
    func validateVerse() {
        let versePredicate = NSPredicate(format: "SELF MATCHES %@", versePattern)
 //       $verseField
        $debounced
            .map { verse in
                return versePredicate.evaluate(with: verse)
            }
            .assign(to: \.verseValid, on: self)
            .store(in: &cancellable)
    }

    /// parse verse and put components into verse[] struct. This will be used in creating a URL to provide to API. verseValid updated as appropriate.
    func parseVerseText() {
        validateVerse()
        if !verseValid { return }
        parsedVerse = Verse()
        let regex = try! NSRegularExpression(pattern: versePattern, options: [])
        let nsString = verseField as NSString
        let nsrange = NSMakeRange(0, nsString.length)

        if let match = regex.firstMatch(in: verseField, options: [], range: nsrange) {
            ["fullVerse", "bookID", "book", "chapter", "verse", "endVerse"].forEach { component in
                let innerRange = match.range(withName: component)
                if innerRange.location != NSNotFound, let range = Range(innerRange, in: verseField) {
                    parsedVerse[component] = "\(verseField[range])"
                } else {
                    parsedVerse[component] = "" // nothing found
                }
            }
            verseValid = true
            return
        }
        verseValid = false
    }

    /// Networking - fetch verse from API and update bibleVerse
    func fetchVerse() {
        if !verseValid { return }
        var finalVerse = ""
        let bookID = parsedVerse.bookID ?? ""
        let book = parsedVerse.book
        let chapter = parsedVerse.chapter
        let verse = parsedVerse.verse
        if let endVerse = parsedVerse.endVerse {
            finalVerse = "-\(endVerse)"
        }
//        let url = URL(string: "https://labs.bible.org/api/?passage=John%203:16&type=json")!
        let url = URL(string: "\(baseURL)\(bookID)\(book)%20\(chapter):\(verse)\(finalVerse)&type=json")!
        handleRequest(url: url)
    }

    func fetchVOTD() {
        let url = URL(string: "\(baseURL)votd")!
        handleRequest(url: url)

    }

    func fetchRandomVerse() {
        let url = URL(string: "\(baseURL)random")!
        handleRequest(url: url)
    }

    private func handleRequest(url: URL) {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        subscriber = perform(request: request)
            .sink(receiveCompletion: completed(with:), receiveValue: received(bibleVerse:))
    }

    private func perform(request: URLRequest) -> AnyPublisher<[BibleVerse], Error> {
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap(decode(result:))
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

    private func decode(result: URLSession.DataTaskPublisher.Output) throws -> [BibleVerse] {
        let decoder = JSONDecoder()
        return try decoder.decode([BibleVerse].self, from: result.data)
    }

    private func received(bibleVerse: [BibleVerse]) {
        self.bibleVerse = bibleVerse
    }

    private func completed(with completion: Subscribers.Completion<Error>) {
        switch completion {
        case .finished:
            return
        case .failure(let error):
            print(error.localizedDescription)
            //TODO: throw an alert up
        }
    }
}


//    func fetch(from url: URL) {
//        URLSession.shared.dataTaskPublisher(for: url)
//            .map(\.data)
//            .decode(type: [BibleVerse].self, decoder: JSONDecoder())
//            .replaceError(with: bibleVerse)
//            .assign(to: &$bibleVerse)
//    }



