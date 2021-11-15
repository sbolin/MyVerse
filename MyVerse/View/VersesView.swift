//
//  VersesView.swift
//  MyVerseLookup
//
//  Created by Scott Bolin on 30-Sep-21.
//

import MobileCoreServices // << for UTI types
import SwiftUI

struct VersesView: View {
    var verses: [BibleVerse]
    @State private var copyVerse: String = ""

    var body: some View {

        ScrollView {
            VStack(alignment: .leading, spacing: 8) {
                HStack(spacing: 4) {
                    Spacer()
                    Text("\(verses[0].bookname)")
                        .font(.system(size: 24, weight: .light, design: .serif)).italic()
                    Text("\(verses[0].chapter)")
                        .font(.system(size: 24, weight: .light, design: .serif)).italic()
                    Spacer()
                }

                    ForEach(verses, id: \.verseText) { verse in
                        VStack(alignment: .leading, spacing: -3) {
                            Text(verse.verse)
                                .font(.system(size: 12, weight: .light))
                                .foregroundColor(.brown)
                            Text(verse.verseText)
                                .font(.system(size: 18, weight: .light, design: .serif)).italic()
                            .padding(.horizontal, 8)
                        }
                    }
            } // VStack
            .foregroundColor(Color(uiColor: .darkGray))
            .frame(maxWidth: .infinity, alignment: .center)
            .padding()
            .background(Color(uiColor: UIColor(named: "VerseBackground")!))
        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.brown, lineWidth: 1))
            Button {
                makeCopyText()
            } label: {
                Text("Copy Verse")
            }
            .padding(8)
            .background(Color(uiColor: UIColor(named: "VerseBackground")!))
            .clipShape(RoundedRectangle(cornerRadius: 8, style: .circular))
        } // ScrollView
    }
    private func makeCopyText() {
        copyVerse = ""
        copyVerse.append(verses.first?.bookname ?? "")
        copyVerse.append(" ")
        copyVerse.append(verses.first?.chapter ?? "")
        copyVerse.append("\n")
        verses.forEach { verse in
            copyVerse.append(verse.verse + "\n")
            copyVerse.append(verse.verseText + "\n")
        }
        UIPasteboard.general.setValue(copyVerse, forPasteboardType: "public.plain-text")
    }
}

struct VersesView_Previews: PreviewProvider {

    static var previews: some View {
        VersesView(verses: BibleVerse.verses)
    }
}

