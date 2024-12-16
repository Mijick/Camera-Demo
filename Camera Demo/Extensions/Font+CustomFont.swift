//
//  Font+CustomFont.swift of Camera Demo
//
//  Created by Tomasz Kurylik. Sending ❤️ from Kraków!
//    - Mail: tomasz.kurylik@mijick.com
//    - GitHub: https://github.com/FulcrumOne
//    - Medium: https://medium.com/@mijick
//
//  Copyright ©2024 Mijick. All rights reserved.


import SwiftUI

extension Font {
    init(_ weight: Font.Weight, size: CGFloat) { switch weight {
        case .regular: self = .custom("Inter-Regular", size: size)
        case .bold: self = .custom("Inter-Bold", size: size)
        default: fatalError("Missing font \(weight)")
    }}
}
