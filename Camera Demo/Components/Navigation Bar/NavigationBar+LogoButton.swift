//
//  NavigationBar+LogoButton.swift of Camera Demo
//
//  Created by Tomasz Kurylik. Sending ❤️ from Kraków!
//    - Mail: tomasz.kurylik@mijick.com
//    - GitHub: https://github.com/FulcrumOne
//    - Medium: https://medium.com/@mijick
//
//  Copyright ©2024 Mijick. All rights reserved.


import SwiftUI

extension NavigationBar { struct LogoButton: View {
    let action: () -> ()

    
    var body: some View {
        Button(action: action) {
            Image(.mcLogo)
                .resizable()
                .frame(width: 40, height: 40)
        }
    }
}}
