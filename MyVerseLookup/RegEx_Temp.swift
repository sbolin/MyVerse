//
//  RegEx_Temp.swift
//  MyVerseLookup
//
//  Created by Scott Bolin on 22-Sep-21.
//

import Foundation

let invitation = "Fancy a game of Cluedo™?"

let instructions = """
The object is to solve by means of elimination and deduction
the problem of the mysterious murder of Dr. Black.
"""

let description = """
Cluedo is a game of skill for 2-6 players.
"""

let suggestion = "I suspect it was Professor Plum, in the Dining Room, with the Candlestick."

let pattern = #"""
(?xi)
(?<suspect>
    ((Miss|Ms\.) \h Scarlett?) |
    ((Colonel | Col\.) \h Mustard) |
    ((Reverend | Mr\.) \h Green) |
    (Mrs\. \h Peacock) |
    ((Professor | Prof\.) \h Plum) |
    ((Mrs\. \h White) | ((Doctor | Dr\.) \h Orchid))
),?(?-x: in the )
(?<location>
    Kitchen        | Ballroom | Conservatory |
    Dining \h Room      |       Library      |
    Lounge         | Hall     | Study
),?(?-x: with the )
(?<weapon>
      Candlestick
    | Knife
    | (Lead(en)?\h)? Pipe
    | Revolver
    | Rope
    | Wrench
)
"""#

var instructionsUS: String {
    instructions.replacingOccurrences(
        of: #"(Dr\.|Doctor) Black"#,
        with: "Mr. Boddy",
        options: .regularExpression
    )
}

func checkName() {
    let range = invitation.range(of: #"\bClue(do)?™?\b"#, options: .regularExpression)
    _ = range != nil
}

func respond() {
    if let range = invitation.range(of: #"\bClue(do)?™?\b"#, options: .regularExpression) {
        switch invitation[range] {
        case "Cluedo":
            print("I'd be delighted to play!")
        case "Clue":
            print("Did you mean Cluedo? If so, then yes!")
        default:
            fatalError("(Wait... did I mess up my regular expression?)")
        }
    } else {
        print("Still waiting for an invitation to play Cluedo.")
    }
}

func getPlayers() {
    let pattern = #"(\d+)[ \p{Pd}](\d+) players"#
    var playerRange: ClosedRange<Int>?

    let nsrange = NSRange(description.startIndex..<description.endIndex,
                          in: description)

    let regex = try! NSRegularExpression(pattern: pattern, options: [])

    regex.enumerateMatches(in: description, options: [], range: nsrange) { (match, _, stop) in
        guard let match = match else { return }

        if match.numberOfRanges == 3,
           let zeroCaptureRange = Range(match.range(at: 0), in: description),
           let firstCaptureRange = Range(match.range(at: 1), in: description),
           let secondCaptureRange = Range(match.range(at: 2), in: description),
           let zeroBound = Int(description[zeroCaptureRange]),
           let lowerBound = Int(description[firstCaptureRange]),
           let upperBound = Int(description[secondCaptureRange]),
           lowerBound > 0 && lowerBound < upperBound
        {
            playerRange = lowerBound...upperBound
            print(zeroBound)
            stop.pointee = true
        }
    }
    print(playerRange!)
    // Prints "2...6"
}

func getGuess() {
    let regex = try! NSRegularExpression(pattern: pattern, options: [])
    let nsrange = NSRange(suggestion.startIndex..<suggestion.endIndex, in: suggestion)
    if let match = regex.firstMatch(in: suggestion, options: [], range: nsrange) {
        for component in ["suspect", "location", "weapon"] {
            let nsrange = match.range(withName: component)
            if nsrange.location != NSNotFound, let range = Range(nsrange, in: suggestion) {
                print("\(component): \(suggestion[range])")
            }
        }
    }
}



