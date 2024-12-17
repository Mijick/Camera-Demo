//
//  MFontModifier.swift of Camera Demo
//
//  Created by Tomasz Kurylik. Sending ❤️ from Kraków!
//    - Mail: tomasz.kurylik@mijick.com
//    - GitHub: https://github.com/FulcrumOne
//    - Medium: https://medium.com/@mijick
//
//  Copyright ©2024 Mijick. All rights reserved.


import SwiftUI

struct MFontModifier: ViewModifier {
    private let font: Font
    private let lineHeight: CGFloat
    private let fontHeight: CGFloat
    private let kerning: CGFloat


    init(_ weight: Font.Weight, size: CGFloat, lineHeight: CGFloat, kerning: CGFloat) {
        self.font = .init(weight, size: size)
        self.lineHeight = lineHeight
        self.fontHeight = size
        self.kerning = kerning
    }
    func body(content: Content) -> some View {
        content
            .font(font)
            .tracking(kerning)
            .lineSpacing(spacing)
            .padding(.vertical, padding)
    }
}
private extension MFontModifier {
    var calculatedLineHeight: CGFloat { lineHeight - fontHeight - 3 }
    var spacing: CGFloat { calculatedLineHeight < 0 ? 0 : calculatedLineHeight }
    var padding: CGFloat { spacing / 2 }
}


// MARK: - TYPOGRAPHY



// MARK: Header
extension MFontModifier {
    static var h1: MFontModifier { .init(.bold, size: 48, lineHeight: 58, kerning: -0.32) }
    static var h2: MFontModifier { .init(.bold, size: 40, lineHeight: 48, kerning: -0.32) }
    static var h3: MFontModifier { .init(.bold, size: 32, lineHeight: 38, kerning: -0.32) }
    static var h4: MFontModifier { .init(.bold, size: 28, lineHeight: 32, kerning: -0.28) }
    static var h5: MFontModifier { .init(.bold, size: 24, lineHeight: 28, kerning: -0.24) }
    static var h6: MFontModifier { .init(.bold, size: 20, lineHeight: 24, kerning: -0.24) }
}

// MARK: Body
extension MFontModifier {
    static var mediumBold: MFontModifier { .init(.bold, size: 16, lineHeight: 24, kerning: -0.16) }
    static var mediumRegular: MFontModifier { .init(.regular, size: 16, lineHeight: 24, kerning: 0) }
    static var smallRegular: MFontModifier { .init(.regular, size: 12, lineHeight: 20, kerning: 0.16) }
    static var smallBold: MFontModifier { .init(.bold, size: 12, lineHeight: 20, kerning: 0) }
}
