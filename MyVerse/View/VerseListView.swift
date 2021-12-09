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
        AdaptiveView {
            VStack {
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
                } // HStack
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
                } // HStack
            } // VStack
            .frame(maxWidth: UIScreen.main.bounds.width)
            VStack {
                if !viewModel.bibleVerse.isEmpty {
                    VersesView(verses: viewModel.bibleVerse)
                } else {
                    EmptyView()
                    Spacer()
                }
            } // VStack
            .frame(maxWidth: UIScreen.main.bounds.width)
        } // AdaptiveView
        .padding()
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
                .previewInterfaceOrientation(.landscapeLeft)
        }
    }
}
