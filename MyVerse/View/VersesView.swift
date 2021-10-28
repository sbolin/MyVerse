//
//  VersesView.swift
//  MyVerseLookup
//
//  Created by Scott Bolin on 30-Sep-21.
//

import SwiftUI

struct VersesView: View {
    var verses: [BibleVerse]
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 4) {
                Spacer()
                Text("\(verses[0].bookname)")
                Text("\(verses[0].chapter)")
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
        }
        .foregroundColor(Color(uiColor: .darkGray))
        .frame(maxWidth: .infinity, alignment: .center)
//        .padding(.vertical, 8)
        .padding()
        .background(Color(uiColor: UIColor(named: "VerseBackground")!))
//        .overlay(RoundedRectangle(cornerRadius: 6))
    }
}

struct VersesView_Previews: PreviewProvider {

    static var previews: some View {
        VersesView(verses: BibleVerse.verses)
            .previewLayout(.sizeThatFits)
    }
}

