//
//  ContentView.swift of Camera Demo
//
//  Created by Tomasz Kurylik. Sending ❤️ from Kraków!
//    - Mail: tomasz.kurylik@mijick.com
//    - GitHub: https://github.com/FulcrumOne
//    - Medium: https://medium.com/@mijick
//
//  Copyright ©2024 Mijick. All rights reserved.


import SwiftUI
import MijickCamera

struct ContentView: View {
    var viewModel: ContentViewModel = .init()


    var body: some View {
        VStack(spacing: 0) {
            createNavigationBar()
            createScrollableView()
        }
        .padding(.horizontal, 16)
        .background(Color(.backgroundPrimary).ignoresSafeArea())
        .preferredColorScheme(.dark)
    }
}
private extension ContentView {
    func createNavigationBar() -> some View {
        NavigationBar()
    }
    func createScrollableView() -> some View {
        ScrollView {
            VStack(spacing: 64) {
                createControlButtons()
                createUploadedMediaView()
            }
            .padding(.top, 32)
            .padding(.bottom, 44)
        }
        .scrollIndicators(.hidden)
    }
}
private extension ContentView {
    func createControlButtons() -> some View {
        HStack(spacing: 12) {
            createCapturePictureButton()
            createCaptureVideoButton()
            Spacer()
        }
    }
    func createUploadedMediaView() -> some View {
        VStack(alignment: .leading, spacing: 20) {
            createUploadedMediaHeader()
            createUploadedMediaItems()
        }
    }
}
private extension ContentView {
    func createCapturePictureButton() -> some View {
        ActionButton(icon: .scPicture, title: "Capture Picture") {
            viewModel.presentCapturePicturePopup()
        }
    }
    func createCaptureVideoButton() -> some View {
        ActionButton(icon: .scVideo, title: "Capture Video") {

        }
    }
    func createUploadedMediaHeader() -> some View {
        Text("Uploaded Media")
            .font(.h6)
            .foregroundStyle(.textPrimary)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    func createUploadedMediaItems() -> some View {
        EmptyView()
    }
}
private extension ContentView {

}
private extension ContentView {

}
private extension ContentView {

}







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
            .onImageCaptured {
                viewModel.uploadedMedia.append($0)
                $1.closeMCamera()
            }
            .startSession()
    }
}
private extension CapturePicturePopup {

}
private extension CapturePicturePopup {

}
private extension CapturePicturePopup {

}





@Observable class ContentViewModel {
    var uploadedMedia: [Any] = []
}

extension ContentViewModel {
    @MainActor func presentCapturePicturePopup() { Task {
        await CapturePicturePopup(viewModel: self).present()
    }}
}
