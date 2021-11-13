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


    static var verses: [BibleVerse] = [
        BibleVerse(
            bookname: "John",
            chapter: "3",
            verse: "16",
            text: "For this is the way God loved the world: He gave his one and only Son, so that everyone who believes in him will not perish but have eternal life."),
        BibleVerse(
            bookname: "John",
            chapter: "3",
            verse: "17",
            text: "For God did not send his Son into the world to condemn the world, but that the world should be saved through him."),
        BibleVerse(
            bookname: "John",
            chapter: "3",
            verse: "18",
            text: "The one who believes in him is not condemned. The one who does not believe has been condemned already, because he has not believed in the name of the one and only Son of God."),
        BibleVerse(
            bookname: "John",
            chapter: "3",
            verse: "19",
            text: "Now this is the basis for judging: that the light has come into the world and people loved the darkness rather than the light because their deeds were evil."),
        BibleVerse(
            bookname: "John",
            chapter: "3",
            verse: "20",
            text: "For everyone who does evil deeds hates the light and does not come to the light, so that their deeds will not be exposed.")
    ]
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
