//
//  VerseListView.swift
//  MyVerseLookup
//
//  Created by Scott Bolin on 21-Sep-21.
//

import SwiftUI

struct VerseListView: View {
    @ObservedObject var viewModel: VerseViewModel

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 12) {
                HStack(alignment: .center) {
                    VerseLookupView(verseIsValid: viewModel.verseValid, field: $viewModel.verseField)
                        .padding(.top, 12)
                    Button {
                        viewModel.parseVerseText()
                        viewModel.fetchVerse()
                    } label: {
                        Image(systemName: "magnifyingglass.circle.fill")
                            .font(.system(size: 26))
                    }
                    .foregroundColor(.brown)
                    .offset(y: -4.5)
//                    .disabled(!viewModel.verseValid)
                }
//                Text("Book ID: \(viewModel.parsedVerse.bookID ?? "")")
//                Text("Book: \(viewModel.parsedVerse.book)")
//                Text("Chapter: \(viewModel.parsedVerse.chapter)")
//                Text("Verse: \(viewModel.parsedVerse.verse)")
//                Text("End Verse: \(viewModel.parsedVerse.endVerse ?? "")")
//                Text("Valid: \(viewModel.verseValid.description)")
                if !viewModel.bibleVerse.isEmpty {
                    ScrollView {
                        VersesView(verses: viewModel.bibleVerse)
                    }
//                    VerseView(verseText: viewModel.bibleVerse[0].verseText)
                }
                Spacer()
            }
            .padding(.horizontal)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Image(systemName: "book.circle.fill")
                            .font(.title3)
                        Text("Verse Lookup")
                            .font(.title).bold()
                    }
                    .foregroundColor(.brown)
                }
            }
        }
        .onReceive(viewModel.$debounced) { newValue in
            guard !newValue.isEmpty else {
                return
            }
            UserDefaults.standard.setValue(newValue, forKey: UserDefaultKeys.lastVerse)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        VerseListView(viewModel: VerseViewModel())

    }
}
