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
            createScrollableView()
            createNavigationBar()
        }
        .padding(.horizontal, 20)
        .background(Color(.backgroundPrimary).ignoresSafeArea())
        .animation(.smooth, value: viewModel.uploadedMedia.count)
        .preferredColorScheme(.dark)
    }
}
private extension ContentView {
    func createScrollableView() -> some View {
        ScrollView {
            VStack(spacing: 36) {
                createCaptureMediaPopup()
                createUploadedMediaView()
            }
            .padding(.top, 12)
            .padding(.bottom, 72)
        }
        .scrollIndicators(.hidden)
    }
    func createNavigationBar() -> some View {
        NavigationBar()
    }
}
private extension ContentView {
    func createCaptureMediaPopup() -> some View {
        ActionButton {
            viewModel.presentCaptureMediaPopup()
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
    func createUploadedMediaHeader() -> some View {
        VStack(alignment: .leading, spacing: 12) {
            createUploadedMediaHeaderTitle()
            createUploadedMediaHeaderDescription()
        }
    }
    func createUploadedMediaItems() -> some View {
        VStack(spacing: 20) {
            ForEach(viewModel.uploadedMedia, id: \.date, content: createMediaItem)
        }
    }
}
private extension ContentView {
    func createUploadedMediaHeaderTitle() -> some View {
        Text("Uploaded Media")
            .font(.h6)
            .foregroundStyle(.textPrimary)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    @ViewBuilder func createUploadedMediaHeaderDescription() -> some View { if viewModel.uploadedMedia.isEmpty {
        Text("Psst! This is an interactive demo. Tap on the buttons above to see the magic happen.")
            .font(.mediumRegular)
            .foregroundStyle(.textSecondary)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.trailing, 36)
    }}
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
