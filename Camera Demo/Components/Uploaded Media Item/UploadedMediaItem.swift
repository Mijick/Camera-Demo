//
//  UploadedMediaItem.swift of Camera Demo
//
//  Created by Tomasz Kurylik. Sending ❤️ from Kraków!
//    - Mail: tomasz.kurylik@mijick.com
//    - GitHub: https://github.com/FulcrumOne
//    - Medium: https://medium.com/@mijick
//
//  Copyright ©2024 Mijick. All rights reserved.


import SwiftUI

struct UploadedMediaItem: View {
    let image: Image
    let title: String
    let date: Date
    let duration: Duration
    let onDeleteButtonTap: () -> ()


    var body: some View {
        HStack(spacing: 16) {
            createImage()
            createText()
            Spacer()
            createTrashButton()
        }
    }
}
private extension UploadedMediaItem {
    func createImage() -> some View {
        image
            .resizable()
            .frame(width: 72, height: 72)
            .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
    }
    func createText() -> some View {
        VStack(alignment: .leading, spacing: -2) {
            createTitleText()
            createDateText()
            Spacer()
            createDurationText()
        }.frame(height: 72)
    }
    func createTrashButton() -> some View {
        Button(action: onDeleteButtonTap) {
            Image(.scTrash)
                .resizable()
                .frame(width: 18, height: 18)
                .foregroundStyle(.textPrimary)
                .frame(width: 40, height: 30)
        }
    }
}
private extension UploadedMediaItem {
    func createTitleText() -> some View {
        Text(title)
            .font(.mediumBold)
            .foregroundStyle(.textPrimary)
    }
    func createDateText() -> some View {
        Text(date.formatted(date: .long, time: .shortened))
            .font(.smallRegular)
            .foregroundStyle(.textSecondary)
    }
    func createDurationText() -> some View {
        Text(duration.formatted(.time(pattern: .minuteSecond)))
            .font(.smallRegular)
            .foregroundStyle(.textSecondary)
    }
}


// MARK: Preview
#Preview(traits: .sizeThatFitsLayout) {
    UploadedMediaItem(
        image: .init(.mcLogo),
        title: "Image 1",
        date: .now,
        duration: .init(secondsComponent: 2137, attosecondsComponent: 0),
        onDeleteButtonTap: {}
    )
}
