//
//  Button.swift
//  clio-app
//
//  Created by Luciana Adrião on 17/09/23.
//

import SwiftUI

struct ActionButton: View {
    var title: String
    var foregroundColor: Color
    var backgroundColor: Color?
    var radius: CGFloat = 16
    var hasBorder: Bool

    var action: () -> Void

    var body: some View {
        Button(action: {
            UIImpactFeedbackGenerator(style: .soft).impactOccurred()
            AudioManager.shared.playSound(named: .actionButton)
            action()
        }) {
            ZStack {
                if hasBorder {
                    RoundedRectangle(cornerRadius: radius)
                        .foregroundColor(backgroundColor)
                        .overlay {
                            RoundedRectangle(cornerRadius: radius)
                                .stroke(style: StrokeStyle(lineWidth: 2.0))
                                .foregroundColor(.black)
                        }.offset(x: 7, y: 5)
                }

                RoundedRectangle(cornerRadius: radius)
                    .fill(foregroundColor)
                    .overlay {
                        RoundedRectangle(cornerRadius: radius)
                            .stroke(style: StrokeStyle(lineWidth: 2.0))
                            .fill(.black)
                    }
                
                StrokeText(
                   text: NSLocalizedString(title, comment: "Button Title"),
                   borderWidth: 2,
                   borderColor: .black)
                .foregroundColor(.white)
                .font(.itimRegular(fontType: .button))
            }
        }
    }
}

struct SwiftUIButton_Previews: PreviewProvider {
    static var previews: some View {
        ActionButton(title: "crie uma sessão", foregroundColor: .white, backgroundColor: Color("Brick"), hasBorder: true) {
        }
    }
}
