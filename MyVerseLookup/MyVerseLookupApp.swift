//
//  MyVerseLookupApp.swift
//  MyVerseLookup
//
//  Created by Scott Bolin on 21-Sep-21.
//

import SwiftUI

@main
struct MyVerseLookupApp: App {
    var body: some Scene {
        WindowGroup {
            VerseListView(viewModel: VerseViewModel())
                .onAppear {
                    UserDefaults.standard.setValue(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
                }
        }
    }
}
