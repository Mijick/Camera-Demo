//
//  NavigationBar.swift of Camera Demo
//
//  Created by Tomasz Kurylik. Sending ❤️ from Kraków!
//    - Mail: tomasz.kurylik@mijick.com
//    - GitHub: https://github.com/FulcrumOne
//    - Medium: https://medium.com/@mijick
//
//  Copyright ©2024 Mijick. All rights reserved.


import SwiftUI

struct NavigationBar: View {
    var body: some View {
        HStack(spacing: 8) {
            createLogoButton()
            Spacer()
            createMediumButton()
            createDiscordButton()
            createGithubButton()
        }
        .padding(.top, 8)
        .padding(.bottom, 4)
    }
}
private extension NavigationBar {
    func createLogoButton() -> some View {
        LogoButton {
            openURL("https://link.mijick.com/website")
        }
    }
    func createMediumButton() -> some View {
        SocialMediaButton(icon: .scMedium) {
            openURL("https://link.mijick.com/medium")
        }
    }
    func createDiscordButton() -> some View {
        SocialMediaButton(icon: .scDiscord) {
            openURL("https://link.mijick.com/discord")
        }
    }
    func createGithubButton() -> some View {
        SocialMediaButton(icon: .scGithub) {
            openURL("https://link.mijick.com/github")
        }
    }
}

private extension NavigationBar {
    func openURL(_ urlString: String) {
        guard let url = URL(string: urlString) else { return }
        UIApplication.shared.open(url)
    }
}


// MARK: Preview
#Preview(traits: .sizeThatFitsLayout) {
    NavigationBar()
}
