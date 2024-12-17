//
//  CaptureVideoPopup.swift of Camera Demo
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

struct CaptureVideoPopup: BottomPopup {
    let viewModel: ContentViewModel
    @State private var shouldShowCamera: Bool = false


    func configurePopup(config: BottomPopupConfig) -> BottomPopupConfig { config
        .heightMode(.fullscreen)
        .backgroundColor(.black)
    }
    var body: some View {
        ZStack { if shouldShowCamera {
            MCamera()
                .setCameraOutputType(.video)
                .setCameraScreen(createCameraScreen)
                .setCloseMCameraAction(closeMCameraAction)
                .onVideoCaptured(onVideoCaptured)
                .startSession()
        }}
        .frame(maxHeight: .infinity)
        .onAppear(perform: onAppear)
    }
}
private extension CaptureVideoPopup {
    func createCameraScreen(cameraManager: CameraManager, namespace: Namespace.ID, closeMCameraAction: @escaping () -> ()) -> DefaultCameraScreen {
        DefaultCameraScreen(cameraManager: cameraManager, namespace: namespace, closeMCameraAction: closeMCameraAction)
            .cameraOutputSwitchAllowed(false)
    }
}

private extension CaptureVideoPopup {
    func onAppear() { Task {
        await Task.sleep(seconds: 0.5)
        shouldShowCamera = true
    }}
    func closeMCameraAction() { Task {
        await dismissLastPopup()
    }}
    func onVideoCaptured(_ videoURL: URL, _ controller: MCamera.Controller) { Task {
        await viewModel.addMedia(videoURL)
        controller.closeMCamera()
    }}
}
