//
//  TextFieldView.swift
//  clio-app
//
//  Created by Beatriz Leonel da Silva on 18/09/23.
//

import SwiftUI

struct TextFieldView: View {
    
    @Binding var inputText: String
    let placeholder: String
    let color: Color
    
    var body: some View {
        ZStack {
            TextField(
                "",
                text: $inputText,
                prompt: Text(.init(placeholder))
                    .font(.itimRegular())
                    .foregroundColor(.gray)
            )
            .onTapGesture {
                #if canImport(UIKit)
                UIImpactFeedbackGenerator(style: .light).impactOccurred()
                #endif
            }
            .font(.itimRegular())
            .foregroundColor(.black)
            .padding(.vertical, 10)
            .padding(.horizontal)
            .background { Color.white }
            .cornerRadius(16)
            .background {
                BorderedBackground(
                    foregroundColor: color,
                    backgroundColor: color,
                    hasBorder: true)
            }
        }
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        @State var input: String = ""
        TextFieldView(inputText: $input, placeholder: "PlaceHolder", color: .lapisLazuli)
    }
}
