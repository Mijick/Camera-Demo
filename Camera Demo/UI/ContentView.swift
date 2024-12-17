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
import AVKit
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
        .animation(.smooth, value: viewModel.uploadedMedia.count)
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
            viewModel.presentCaptureVideoPopup()
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
            ForEach(viewModel.uploadedMedia, id: \.date, content: createMediaItem)
        }
    }
}
private extension ContentView {
    func createMediaItem(_ item: CapturedMedia) -> some View {
        UploadedMediaItem(
            image: item.image,
            title: item.title,
            date: item.date,
            duration: item.duration,
            onDeleteButtonTap: { viewModel.deleteMedia(item) }
        )
    }
}
