//
//  NavigationBar+SocialMediaButton.swift of Camera Demo
//
//  Created by Tomasz Kurylik. Sending ❤️ from Kraków!
//    - Mail: tomasz.kurylik@mijick.com
//    - GitHub: https://github.com/FulcrumOne
//    - Medium: https://medium.com/@mijick
//
//  Copyright ©2024 Mijick. All rights reserved.


import SwiftUI

extension NavigationBar { struct SocialMediaButton: View {
    let icon: ImageResource
    let action: () -> ()


    var body: some View {
        Button(action: action) {
            Image(icon)
                .resizable()
                .frame(width: 22, height: 22)
                .foregroundColor(Color(.textPrimary))
                .frame(width: 40, height: 40)
                .background(Color(.backgroundSecondary))
                .clipShape(RoundedRectangle(cornerRadius: 13, style: .continuous))
        }
    }
}}
