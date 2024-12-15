//
//  CustomCameraPreview.swift of CameraView-Demo
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//    - GitHub: https://github.com/FulcrumOne
//
//  Copyright ©2024 Mijick. Licensed under MIT License.


import SwiftUI
import MijickCameraView

struct CustomCameraPreview: MCameraPreview {
    let capturedMedia: MijickCameraView.MCameraMedia
    let namespace: Namespace.ID
    let retakeAction: () -> ()
    let acceptMediaAction: () -> ()


    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            createContentView()
            Spacer()
            createButtons()
        }
    }
}
private extension CustomCameraPreview {
    func createContentView() -> some View { ZStack {
        if let image = capturedMedia.image { createImageView(image) }
        else { EmptyView() }
    }}
    func createButtons() -> some View {
        HStack(spacing: 24) {
            createRetakeButton()
            createSaveButton()
        }
    }
}
private extension CustomCameraPreview {
    func createImageView(_ image: UIImage) -> some View {
        Image(uiImage: image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .ignoresSafeArea()
    }
    func createRetakeButton() -> some View {
        Button(action: retakeAction) { Text("Retake") }
    }
    func createSaveButton() -> some View {
        Button(action: acceptMediaAction) { Text("Save") }
    }
}
