//
//  ContentViewModel.swift of Camera Demo
//
//  Created by Tomasz Kurylik. Sending ❤️ from Kraków!
//    - Mail: tomasz.kurylik@mijick.com
//    - GitHub: https://github.com/FulcrumOne
//    - Medium: https://medium.com/@mijick
//
//  Copyright ©2024 Mijick. All rights reserved.


import Foundation

@MainActor @Observable class ContentViewModel {
    private(set) var uploadedMedia: [CapturedMedia] = []
}

// MARK: Interaction with data
extension ContentViewModel {
    func addMedia(_ media: Any) async {
        guard let capturedMedia = await CapturedMedia(media) else { return }
        uploadedMedia.append(capturedMedia)
    }
    func deleteMedia(_ media: CapturedMedia) {
        guard let index = uploadedMedia.firstIndex(of: media) else { return }
        uploadedMedia.remove(at: index)
    }
}

// MARK: Present Popup
extension ContentViewModel {
    func presentCapturePicturePopup() { Task {
        await CapturePicturePopup(viewModel: self).present()
    }}
    func presentCaptureVideoPopup() { Task {
        await CaptureVideoPopup(viewModel: self).present()
    }}
}
