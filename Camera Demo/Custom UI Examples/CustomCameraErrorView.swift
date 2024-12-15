//
//  CustomCameraErrorView.swift of CameraView-Demo
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//    - GitHub: https://github.com/FulcrumOne
//
//  Copyright ©2024 Mijick. Licensed under MIT License.


import SwiftUI
import MijickCamera

struct CustomCameraErrorView: MCameraErrorScreen {
    let error: MCameraError
    let closeMCameraAction: () -> ()


    var body: some View {
        Button(action: openAppSettings) { Text("Open Settings") }
    }
}
