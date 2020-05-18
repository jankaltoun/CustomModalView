//
//  AnyModalStyle.swift
//  
//
//  Created by Jan Kaltoun on 18/05/2020.
//

import SwiftUI

public struct AnyModalStyle: ModalStyle {
    public let animation: Animation?
    
    private let _makeBackground: (ModalStyle.BackgroundConfiguration, Binding<Bool>) -> AnyView
    private let _makeModal: (ModalStyle.ModalContentConfiguration, Binding<Bool>) -> AnyView
    
    init<Style: ModalStyle>(_ style: Style) {
        self.animation = style.animation
        self._makeBackground = style.anyMakeBackground
        self._makeModal = style.anyMakeModal
    }
    
    public func makeBackground(configuration: ModalStyle.BackgroundConfiguration, isPresented: Binding<Bool>) -> AnyView {
        return self._makeBackground(configuration, isPresented)
    }
    
    public func makeModal(configuration: ModalStyle.ModalContentConfiguration, isPresented: Binding<Bool>) -> AnyView {
        return self._makeModal(configuration, isPresented)
    }
}
