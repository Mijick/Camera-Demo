//
//  ActionButton+CameraScreen.swift of Camera Demo
//
//  Created by Tomasz Kurylik. Sending ❤️ from Kraków!
//    - Mail: tomasz.kurylik@mijick.com
//    - GitHub: https://github.com/FulcrumOne
//    - Medium: https://medium.com/@mijick
//
//  Copyright ©2024 Mijick. All rights reserved.


import SwiftUI
import MijickCamera

extension ActionButton { struct CameraScreen: MCameraScreen {
    let cameraManager: CameraManager
    let namespace: Namespace.ID
    let closeMCameraAction: () -> ()


    var body: some View {
        createCameraOutputView().disabled(true)
    }
}}
