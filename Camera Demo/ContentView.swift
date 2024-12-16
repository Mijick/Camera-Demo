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
        VStack(spacing: 20) {
            ForEach(0..<viewModel.uploadedMedia.count, id: \.self, content: createMediaItem)
        }
    }
}
private extension ContentView {
    func createMediaItem(_ index: Int) -> some View {
        UploadedMediaItem(
            image: viewModel.uploadedMedia[index].image,
            title: "Item \(index + 1)",
            date: viewModel.uploadedMedia[index].date,
            duration: viewModel.uploadedMedia[index].duration,
            onDeleteButtonTap: {}
        )
    }
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





@Observable class ContentViewModel {
    var uploadedMedia: [CapturedMedia] = []
}

extension ContentViewModel {
    @MainActor func presentCapturePicturePopup() { Task {
        await CapturePicturePopup(viewModel: self).present()
    }}
}





struct CapturedMedia {
    let image: Image
    let date: Date
    let duration: Duration?


    init?(_ data: Any) async {
        if let image = data as? UIImage { self.init(image: image) }
        else if let videoURL = data as? URL { await self.init(videoURL: videoURL) }
        else { return nil }
    }
}
private extension CapturedMedia {
    init(image: UIImage) {
        self.image = .init(uiImage: image)
        self.date = .init()
        self.duration = nil
    }
    init?(videoURL: URL) async {
        guard let (videoDuration, videoThumbnail) = try? await AVURLAsset(url: videoURL).getVideoDetails() else { return nil }

        self.image = .init(uiImage: videoThumbnail)
        self.date = .init()
        self.duration = videoDuration
    }
}


import AVKit

extension AVURLAsset {
    func getVideoDetails() async throws -> (duration: Duration, thumbnail: UIImage)? {
        let duration = try await getVideoDuration()
        let videoThumbnail = try await getVideoThumbnail()

        return (duration, videoThumbnail)
    }
}
private extension AVURLAsset {
    func getVideoDuration() async throws -> Duration {
        let duration = try await load(.duration)
        return .init(secondsComponent: Int64(duration.seconds), attosecondsComponent: 0)
    }
    func getVideoThumbnail() async throws -> UIImage {
        let assetImageGenerator = AVAssetImageGenerator(asset: self)
        assetImageGenerator.appliesPreferredTrackTransform = true
        assetImageGenerator.apertureMode = AVAssetImageGenerator.ApertureMode.encodedPixels

        let cmTime = CMTime(seconds: 0, preferredTimescale: 60)
        let cgImage = try await assetImageGenerator.image(at: cmTime).image
        let thumbnailImage = UIImage(cgImage: cgImage)
        return thumbnailImage
    }
}
