//
//  CameraView.swift of CameraView-Demo
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//    - GitHub: https://github.com/FulcrumOne
//
//  Copyright ©2024 Mijick. Licensed under MIT License.


import SwiftUI
import MijickCamera

struct CameraView: View {
    @State private var isPopupPresented: Bool = false


    var body: some View {
        createClickMeButton()
            .fullScreenCover(isPresented: $isPopupPresented, content: createCameraController)
    }
}
private extension CameraView {
    func createClickMeButton() -> some View {
        Button(action: { isPopupPresented = true} ) {
            Text("Click me!")
        }
    }
    func createCameraController() -> some View {
        MCamera()
            .lockCameraInPortraitOrientation(AppDelegate.self)
            .onImageCaptured(onImageCaptured)
            .onVideoCaptured(onVideoCaptured)
            .setCloseMCameraAction(onCloseController)
    }
}

// MARK: - Camera Actions
private extension CameraView {
    func onImageCaptured(_ imageData: UIImage, _ controller: MCamera.Controller) {
        print("IMAGE CAPTURED")
    }
    func onVideoCaptured(_ videURL: URL, _ controller: MCamera.Controller) {
        print("VIDEO CAPTURED")
    }
    func afterMediaCaptured() {
        isPopupPresented = false
    }
    func onCloseController() {
        isPopupPresented = false
    }
}
