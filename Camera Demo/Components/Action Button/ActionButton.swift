//
//  ActionButton.swift of Camera Demo
//
//  Created by Tomasz Kurylik. Sending ❤️ from Kraków!
//    - Mail: tomasz.kurylik@mijick.com
//    - GitHub: https://github.com/FulcrumOne
//    - Medium: https://medium.com/@mijick
//
//  Copyright ©2024 Mijick. All rights reserved.


import SwiftUI

struct ActionButton: View {
    let icon: ImageResource
    let title: String
    let action: () -> ()


    var body: some View {
        Button(action: action, label: createButtonLabel)
    }
}
private extension ActionButton {
    func createButtonLabel() -> some View {
        VStack(spacing: 8) {
            createTopView()
            createTitle()
        }
    }
}
private extension ActionButton {
    func createTopView() -> some View {
        Image(icon)
            .resizable()
            .frame(width: 52, height: 52)
            .foregroundStyle(.textPrimary)
            .frame(height: 132)
            .frame(maxWidth: .infinity)
            .background(.backgroundSecondary)
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
    }
    func createTitle() -> some View {
        Text(title)
            .font(.mediumBold)
            .foregroundStyle(.textPrimary)
    }
}


// MARK: Preview
#Preview(traits: .sizeThatFitsLayout) {
    ActionButton(icon: .scPicture, title: "Capture Picture", action: {})
}
