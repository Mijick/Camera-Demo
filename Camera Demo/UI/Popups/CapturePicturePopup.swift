//
//  CapturePicturePopup.swift of Camera Demo
//
//  Created by Tomasz Kurylik. Sending ❤️ from Kraków!
//    - Mail: tomasz.kurylik@mijick.com
//    - GitHub: https://github.com/FulcrumOne
//    - Medium: https://medium.com/@mijick
//
//  Copyright ©2024 Mijick. All rights reserved.


import SwiftUI
import MijickCamera
import MijickPopups

struct CapturePicturePopup: BottomPopup {
    let viewModel: ContentViewModel
    @State private var shouldShowCamera: Bool = false


    func configurePopup(config: BottomPopupConfig) -> BottomPopupConfig { config
        .heightMode(.fullscreen)
        .backgroundColor(.black)
        .enableDragGesture(false)
    }
    var body: some View {
        ZStack { if shouldShowCamera {
            MCamera()
                .lockCameraInPortraitOrientation(AppDelegate.self)
                .setCameraOutputType(.photo)
                .setCloseMCameraAction(closeMCameraAction)
                .onImageCaptured(onImageCaptured)
                .onVideoCaptured(onVideoCaptured)
                .startSession()
        }}
        .frame(maxHeight: .infinity)
        .onAppear(perform: onAppear)
    }
}

private extension CapturePicturePopup {
    func onAppear() { Task {
        await Task.sleep(seconds: 0.5)
        shouldShowCamera = true
    }}
    func closeMCameraAction() { Task {
        await dismissLastPopup()
    }}
    func onImageCaptured(_ image: UIImage, _ controller: MCamera.Controller) { Task {
        await viewModel.addMedia(image)
        controller.closeMCamera()
    }}
    func onVideoCaptured(_ videoURL: URL, _ controller: MCamera.Controller) { Task {
        await viewModel.addMedia(videoURL)
        controller.closeMCamera()
    }}
}
