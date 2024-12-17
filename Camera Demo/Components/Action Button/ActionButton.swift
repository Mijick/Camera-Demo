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
import MijickCamera

struct ActionButton: View {
    let action: () -> ()


    var body: some View {
        Button(action: action, label: createButtonLabel)
    }
}
private extension ActionButton {
    func createButtonLabel() -> some View {
        createMCamera()
            .frame(height: 280)
            .frame(maxWidth: .infinity)
            .overlay(createMCameraOverlay())
            .background(createMCameraBackground())
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
    }
}
private extension ActionButton {
    func createMCamera() -> some View {
        MCamera()
            .setCameraScreen(CameraScreen.init)
            .setGridVisibility(false)
            .setCameraFilters([.init(name: "CIPhotoEffectInstant")!])
            .startSession()
    }
    func createMCameraOverlay() -> some View {
        Image(.scCamera)
            .resizable()
            .frame(width: 48, height: 48)
            .foregroundStyle(.textPrimary)
    }
    func createMCameraBackground() -> some View {
        RoundedRectangle(cornerRadius: 16, style: .continuous)
            .fill(.backgroundSecondary50)
            .stroke(.borderTertiary)
    }
}
