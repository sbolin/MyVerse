//
//  VerseView.swift
//  MyVerseLookup
//
//  Created by Scott Bolin on 28-Sep-21.
//

import SwiftUI

struct VerseView: View {
    var verseText: String
    var body: some View {
        Text(verseText)
            .font(.system(size: 18, weight: .light, design: .serif)).italic()
            .foregroundColor(Color(uiColor: .systemGray))
            .frame(maxWidth: .infinity, alignment: .center)
            .padding()
            .background(Color(uiColor: UIColor(named: "VerseBackground")!))
            .overlay(RoundedRectangle(cornerRadius: 6).strokeBorder())
    }
}

struct VerseView_Previews: PreviewProvider {
    static var previews: some View {
        VerseView(verseText: "For God so loved the world that he gave his only Son, that whoever believes in him should not perish but have eternal life.")
            .previewLayout(.sizeThatFits)
    }
}
