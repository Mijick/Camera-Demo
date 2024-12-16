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
    var viewModel: ContentViewModel


    func configurePopup(config: BottomPopupConfig) -> BottomPopupConfig { config
        .heightMode(.fullscreen)
        .backgroundColor(.black)
    }
    var body: some View {
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
    }
}
private extension CapturePicturePopup {

}
private extension CapturePicturePopup {

}
private extension CapturePicturePopup {

}
