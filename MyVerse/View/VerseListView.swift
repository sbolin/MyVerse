//
//  VerseListView.swift
//  MyVerseLookup
//
//  Created by Scott Bolin on 21-Sep-21.
//

import SwiftUI

struct VerseListView: View {
    @ObservedObject var viewModel: VerseViewModel
    @Environment(\.horizontalSizeClass) var horizontalSizeClass

    var body: some View {
            VStack {
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        TitleView()
                        Spacer()
                        Button {
                            viewModel.fetchRandomVerse()
                            // random verse lookup
                        } label: {
                            Image(systemName: "shuffle.circle")
                                .font(.system(size: 26))
                                .foregroundColor(.brown)
                        }

                    }
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
                    }
                }
                if !viewModel.bibleVerse.isEmpty {
                    ScrollView {
                        VersesView(verses: viewModel.bibleVerse)
                    }
                } else {
                    EmptyView()
                }
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top, 8)
            .onReceive(viewModel.$verseField) { newValue in
                guard !newValue.isEmpty else {
                    return
                }
                UserDefaults.standard.setValue(newValue, forKey: UserDefaultKeys.lastVerse)
            }
            .preferredColorScheme(.light)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            VerseListView(viewModel: VerseViewModel())
                .previewInterfaceOrientation(.portrait)
        }
    }
}
