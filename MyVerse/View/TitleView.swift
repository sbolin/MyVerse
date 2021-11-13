//
//  TitleView.swift
//  MyVerse
//
//  Created by Scott Bolin on 29-Oct-21.
//

import SwiftUI

struct TitleView: View {
    var body: some View {
        HStack {
            Image(systemName: "book.circle.fill")
                .font(.title3)
            Text("Verse Lookup")
                .font(.title).bold()
        }
        .foregroundColor(.brown)
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}
