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
            Spacer()
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
    func createControlButtons() -> some View {
        EmptyView()
    }
    func createUploadedMediaView() -> some View {
        EmptyView()
    }
}
private extension ContentView {

}
private extension ContentView {

}
private extension ContentView {

}
private extension ContentView {

}
