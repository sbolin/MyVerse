//
//  MyVerseApp.swift
//  MyVerse
//
//  Created by Scott Bolin on 21-Sep-21.
//

import SwiftUI

@main
struct MyVerseApp: App {
    var body: some Scene {
        WindowGroup {
            VerseListView(viewModel: VerseViewModel())
                .onAppear {
                    UserDefaults.standard.setValue(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
                }
        }
    }
}
