//
//  BibleAPIResponse.swift
//  MyVerseLookup
//
//  Created by Scott Bolin on 21-Sep-21.
//

import Foundation

/// Model for API use
struct BibleVerse: Decodable {
    var bookname: String = ""
    var chapter: String = ""
    var verse: String = ""
    var text: String = ""

    var verseText: String {
        return text
    }
/*
    var oldTestamentNo: Int = 39
    var newTestamentNo: Int = 27

    var chaptersInBook: [Int] {
        return [50, 40, 27, 36, 34, 24, 21, 4, 31, 24, 22, 25, 29, 36, 10, 13, 10, 42, 150, 31, 12, 8, 66, 52, 5, 48, 12, 14, 3, 9, 1, 4, 7, 3, 3, 3, 2, 14, 4, 28, 16, 24, 21, 28, 16, 16, 13, 6, 6, 4, 4, 5, 3, 6, 4, 3, 1, 13, 5, 5, 3, 5, 1, 1, 1, 22]
    }
*/
}

struct Verse {
    var fullVerse: String = ""
    var bookID: String?
    var book: String = ""
    var chapter: String = ""
    var verse: String = ""
    var endVerse: String?

    subscript(key: String) -> String {
        get {
            switch key {
            case "fullVerse": return self.fullVerse
            case "bookID": return self.bookID ?? ""
            case "book": return self.book
            case "chapter": return self.chapter
            case "verse": return self.verse
            case "endVerse": return self.endVerse ?? ""
            default: fatalError("Invalid key")
            }
        }
        set {
            switch key {
            case "fullVerse": self.fullVerse = newValue
            case "bookID": self.bookID = newValue
            case "book": self.book = newValue
            case "chapter": self.chapter = newValue
            case "verse": self.verse = newValue
            case "endVerse": self.endVerse = newValue
            default: fatalError("Invalid key")
            }
        }
    }
}
