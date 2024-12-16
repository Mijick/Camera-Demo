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
    @State private var uploadedMedia: [Any] = []


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
