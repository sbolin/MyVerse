//
//  VerseLookupView.swift
//  MyVerseLookup
//
//  Created by Scott Bolin on 23-Sep-21.
//

import SwiftUI

struct VerseLookupView: View {
    var sfSymbolName: String = "book"
    var placeholder: String = "Verse?"
    var prompt: String = "Please enter a valid verse"
    var verseIsValid: Bool = true
    @Binding var field: String

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: sfSymbolName)
                    .foregroundColor(.gray)
                    .font(.headline)
                    .frame(width: 20)
                ZStack(alignment: .leading) {
                    Text(placeholder)
                        .foregroundColor(field.isEmpty ? Color(.placeholderText) : Color.blue)
                        .offset(y: field.isEmpty ? 0 : -38)
                        .scaleEffect(field.isEmpty ? 1 : 0.8, anchor: .leading)
                        .animation(.default, value: field.isEmpty)
                    TextField(placeholder, text: $field)
                }// zstack
            } // hstack
            .autocapitalization(.none)
            .padding(8)
            .background(Color(.secondarySystemBackground))
            .overlay(RoundedRectangle(cornerRadius: 6).stroke(verseIsValid ? Color.green : Color.pink.opacity(0.5), lineWidth: verseIsValid ? 1 : 1))
            Text(verseIsValid ? "" : prompt)
                .foregroundColor(.secondary)
                .fixedSize(horizontal: false, vertical: true)
                .font(.caption)
        } // vstack
    } // view
}

struct VerseLookupView_Previews: PreviewProvider {
    static var previews: some View {
        VerseLookupView(field: .constant("John 3:16"))
    }
}
