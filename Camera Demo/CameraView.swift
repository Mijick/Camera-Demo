//
//  CameraView.swift of Camera Demo
//
//  Created by Tomasz Kurylik. Sending ❤️ from Kraków!
//    - Mail: tomasz.kurylik@mijick.com
//    - GitHub: https://github.com/FulcrumOne
//    - Medium: https://medium.com/@mijick
//
//  Copyright ©2024 Mijick. All rights reserved.


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
            .startSession()
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
