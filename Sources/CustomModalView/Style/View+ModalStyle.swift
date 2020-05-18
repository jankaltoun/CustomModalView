//
//  View+ModalStyle.swift
//  
//
//  Created by Jan Kaltoun on 18/05/2020.
//

import SwiftUI

public extension View {
    func modalStyle<Style: ModalStyle>(_ style: Style) -> some View {
        self
            .environment(\.modalStyle, AnyModalStyle(style))
    }
}
