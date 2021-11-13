//
//  AdaptiveView.swift
//  MyVerse
//
//  Created by Scott Bolin on 29-Oct-21.
//

import SwiftUI

struct AdaptiveView<Content: View>: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    var content: Content

    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        if horizontalSizeClass == .compact {
            VStack(alignment: .leading, spacing: 12) {
                content
                Spacer()
            }
        } else {
            HStack(spacing: 12) {
                content
                Spacer()
            }
        }
    }
}
