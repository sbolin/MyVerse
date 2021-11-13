//
//  BibleInfo.swift
//  MyVerseLookup
//
//  Created by Scott Bolin on 28-Sep-21.
//

import Foundation
/*
struct BibleInfo {

    func BookFromAbr(abr: String) -> String? {
        for (index, bookNames) in bookAbbreviation.enumerated() {
            if bookNames.contains(abr) {
                return books[index]
            }
        }
        return nil
    }

    var books: [String] {
        return ["Genesis",
                "Exodus",
                "Leviticus",
                "Numbers",
                "Deuteronomy",
                "Joshua",
                "Judges",
                "Ruth",
                "1%20Samuel",
                "2%20Samuel",
                "1%20Kings",
                "2%20Kings",
                "1%20Chronicles",
                "2%20Chronicles",
                "Ezra",
                "Nehemiah",
                "Esther",
                "Job",
                "Psalms",
                "Proverbs",
                "Ecclesiastes",
                "Song%20of%20Solomon",
                "Isaiah",
                "Jeremiah",
                "Lamentations",
                "Ezekiel",
                "Daniel",
                "Hosea",
                "Joel",
                "Amos",
                "Obadiah",
                "Jonah",
                "Micah",
                "Nahum",
                "Habakkuk",
                "Zephaniah",
                "Haggai",
                "Zechariah",
                "Malachi",
                "Matthew",
                "Mark",
                "Luke",
                "John",
                "Acts",
                "Romans",
                "1%20Corinthians",
                "2%20Corinthians",
                "Galatians",
                "Ephesians",
                "Philippians",
                "Colossians",
                "1%20Thessalonians",
                "2%20Thessalonians",
                "1%20Timothy",
                "2%20Timothy",
                "Titus",
                "Philemon",
                "Hebrews",
                "James",
                "1%20Peter",
                "2%20Peter",
                "1%20John",
                "2%20John",
                "3%20John",
                "Jude",
                "Revelation"]
    }

    var bookAbbreviation: [[String]] {
        return [
            ["Genesis", "Gen", "Ge", "Gn"],
            ["Exodus", "Ex", "Exo", "Exod"],
            ["Leviticus", "Lev", "Le", "Lv"],
            ["Numbers", "Num", "Nu", "Nm", "Nb"],
            ["Deuteronomy", "Deut", "De", "Dt"],
            ["Joshua", "Josh", "Jos", "Jsh"],
            ["Judges", "Judg", "Jdg", "Jg", "Jdgs"],
            ["Ruth", "Ruth", "Rth", "Ru"],
            ["1 Samuel", "1 Sam", "1 Sm", "1 Sa"],
            ["2 Samuel", "2 Sam", "2 Sm", "2 Sa"],
            ["1 Kings", "1 Kings", "1 Kgs", "1 Ki"],
            ["2 Kings", "2 Kings", "2 Kgs", "2 Ki"],
            ["1 Chronicles", "1 Chron", "1 Chr", "1 Ch"],
            ["2 Chronicles", "2 Chron", "2 Chr", "2 Ch"],
            ["Ezra", "Ezra", "Ezr", "Ez"],
            ["Nehemiah", "Neh", "Ne"],
            ["Esther", "Est", "Esth", "Es"],
            ["Job", "Job", "Jb"],
            ["Psalms", "Ps", "Psalm", "Pslm", "Psa"],
            ["Proverbs", "Prov", "Pro", "Pr"],
            ["Ecclesiastes", "Eccles", "Eccle", "Ecc"],
            ["Song of Solomon", "Sol", "Song", "Song of Songs"],
            ["Isaiah", "Isa", "Is"],
            ["Jeremiah", "Jer", "Je"],
            ["Lamentations", "Lam", "La"],
            ["Ezekiel", "Eze", "Ezk", "Ezek"],
            ["Daniel", "Dan", "Da", "Dn"],
            ["Hosea", "Hos", "Ho"],
            ["Joel", "Joel", "Jl"],
            ["Amos", "Amos", "Am"],
            ["Obadiah", "Obad", "Ob"],
            ["Jonah", "Jonah", "Jon", "Jnh"],
            ["Micah", "Mic", "Mc"],
            ["Nahum", "Nah", "Na"],
            ["Habakkuk", "Hab", "Hb"],
            ["Zephaniah", "Zeph", "Zep", "Zp"],
            ["Haggai", "Hag", "Hg"],
            ["Zechariah", "Zech", "Zec", "Zc"],
            ["Malachi", "Mal", "Ml"],
            ["Matthew", "Matt", "Mt"],
            ["Mark", "Mark", "Mar", "Mk"],
            ["Luke", "Luke", "Luk", "Lk"],
            ["John", "John", "Joh", "Jn"],
            ["Acts", "Acts", "Act", "Ac"],
            ["Romans", "Rom", "Ro", "Rm"],
            ["1 Corinthians", "1 Cor", "1 Co"],
            ["2 Corinthians", "2 Cor", "2 Co"],
            ["Galatians", "Gal", "Ga"],
            ["Ephesians", "Eph", "Ep"],
            ["Philippians", "Phil", "Php", "Pp"],
            ["Colossians", "Col", "Co"],
            ["1 Thessalonians", "1 Thess", "1 Thes", "1 Th"],
            ["2 Thessalonians", "2 Thess", "2 Thes", "2 Th"],
            ["1 Timothy", "1 Tim", "1 Ti"],
            ["2 Timothy", "2 Tim", "2 Ti"],
            ["Titus", "Titus", "Tit"],
            ["Philemon", "Philem", "Phm", "Pm"],
            ["Hebrews", "Heb"],
            ["James", "James", "Jm", "Jas"],
            ["1 Peter", "1 Pet", "1 Pe", "1 Pt"],
            ["2 Peter", "1 Pet", "1 Pe", "1 Pt"],
            ["1 John", "1 John", "1 Jn"],
            ["2 John", "2 John", "2 Jn"],
            ["3 John", "3 John", "3 Jn"],
            ["Jude", "Jude", "Jud", "Jd"],
            ["Revelation", "Rev", "Re"]
        ]
    }
 /*
  let oldTestamentBooks: Int = 39
  let newTestamentBooks: Int = 27

  let oldTestamentChapters: Int = 909
  let newTestamentChapters: Int = 204

  let oldTestamentVerses: Int = ?
  let newTestamentVerses: Int = ?

  // order matches order of books in Bible, ie Genesis is chaptersInBook[0], etc
  // in order to do this for verses gets out of hand - each chapter would have a corresponding number of verses
  var chaptersInBook: [Int] {
  return [50, 40, 27, 36, 34, 24, 21, 4, 31, 24, 22, 25, 29, 36, 10, 13, 10, 42, 150, 31, 12, 8, 66, 52, 5, 48, 12, 14, 3, 9, 1, 4, 7, 3, 3, 3, 2, 14, 4, 28, 16, 24, 21, 28, 16, 16, 13, 6, 6, 4, 4, 5, 3, 6, 4, 3, 1, 13, 5, 5, 3, 5, 1, 1, 1, 22]
  }
  */
}
*/
