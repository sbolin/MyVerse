//
//  AdaptiveView.swift
//  MyVerse
//
//  Created by Scott Bolin on 29-Oct-21.
//

import SwiftUI

struct AdaptiveView<Content: View>: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass
    var content: Content

    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        if verticalSizeClass == .compact {
            HStack(alignment: .top ,spacing: 12) {
                content
                Spacer()
            }
        } else {
            VStack(alignment: .leading ,spacing: 12) {
                content
                Spacer()
            }
        }
    }
}
