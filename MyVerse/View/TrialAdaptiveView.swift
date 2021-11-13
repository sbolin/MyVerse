//
//  TrialAdaptiveView.swift
//  MyVerse
//
//  Created by Scott Bolin on 29-Oct-21.
//

import SwiftUI

struct TrialAdaptiveView: View {
    var body: some View {
        AdaptiveView {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.red)
                .frame(maxWidth: 400)
            VStack {
                Text("Title")
                    .bold()
                    .font(.title)
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. ")
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .padding(.top)
        .padding()
    }
}

struct TrialAdaptiveView_Previews: PreviewProvider {
    static var previews: some View {
        TrialAdaptiveView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
