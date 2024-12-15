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
import MijickCameraView

struct CustomCameraErrorView: MCameraErrorView {
    let error: CameraManager.Error
    let closeControllerAction: () -> ()


    var body: some View {
        Button(action: openAppSettings) { Text("Open Settings") }
    }
}
