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
            ForEach(verses, id: \.verseText) { verse in
                Text(verse.verseText)
                    .font(.system(size: 18, weight: .light, design: .serif)).italic()
                    .padding(.horizontal, 8)
            }
            .foregroundColor(Color(uiColor: .systemGray))
//            .padding()
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .padding(.vertical, 8)
        .background(Color(uiColor: UIColor(named: "VerseBackground")!))
        .overlay(RoundedRectangle(cornerRadius: 6).strokeBorder())
    }
}

struct VersesView_Previews: PreviewProvider {

    static var previews: some View {
        VersesView(verses: BibleVerse.verses)
            .previewLayout(.sizeThatFits)
    }
}

