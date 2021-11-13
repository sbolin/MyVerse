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
    @Environment(\.clearButtonHidden) var clearButtonHidden

    var clearButton: some View {
        HStack {
            if !clearButtonHidden {
                Spacer()
                Button {
                    field = ""
                } label: {
                    Image(systemName: "multiply.circle.fill")
                        .foregroundColor(Color(UIColor.systemGray))
                }
            }
            else {
                EmptyView()
            }
        }
    }

    var clearButtonPadding: CGFloat {
        !clearButtonHidden ? 25 : 0
    }

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
                        .padding(.trailing, clearButtonPadding)
                        .overlay(clearButton)
                }// zstack
            } // hstack
            .autocapitalization(.none)
            .padding(8)
            .background(Color(.systemGray6))
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
            .clearButtonHidden()

        VerseLookupView(field: .constant("John 3:16"))
            .preferredColorScheme(.dark)
    }
}

extension View {
    func clearButtonHidden(_ hidesClearButton: Bool = true) -> some View {
        environment(\.clearButtonHidden, hidesClearButton)
    }
}

private struct TextInputFieldClearButtonHidden: EnvironmentKey {
    static var defaultValue: Bool = false
}

extension EnvironmentValues {
    var clearButtonHidden: Bool {
        get { self[TextInputFieldClearButtonHidden.self] }
        set { self[TextInputFieldClearButtonHidden.self] = newValue }
    }
}
