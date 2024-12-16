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
    }
    var body: some View {
        ZStack { if shouldShowCamera {
            MCamera()
                .setCameraOutputType(.photo)
                .setCameraScreen {
                    DefaultCameraScreen(cameraManager: $0, namespace: $1, closeMCameraAction: $2)
                        .cameraOutputSwitchAllowed(false)
                }
                .setCloseMCameraAction {
                    Task { await dismissLastPopup() }
                }
                .onImageCaptured { image, controller in Task {
                    if let capturedMedia = await CapturedMedia(image) {
                        viewModel.uploadedMedia.append(capturedMedia)
                    }
                    controller.closeMCamera()
                }}
                .startSession()
        }}
        .frame(maxHeight: .infinity)
        .onAppear { Task {
            await Task.sleep(seconds: 0.5)
            shouldShowCamera = true
        }}
    }
}
private extension CapturePicturePopup {

}
private extension CapturePicturePopup {

}
private extension CapturePicturePopup {

}
