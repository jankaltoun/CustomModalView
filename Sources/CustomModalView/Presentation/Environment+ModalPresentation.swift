//
//  Environment+ModalPresentation.swift
//  
//
//  Created by Jan Kaltoun on 18/05/2020.
//

import SwiftUI

struct ModalPresentationModeKey: EnvironmentKey {
    static let defaultValue: Binding<ModalPresentationMode> = .constant(
        ModalPresentationMode(underlyingBinding: .constant(false))
    )
}

public extension EnvironmentValues {
    var modalPresentationMode: Binding<ModalPresentationMode> {
        get {
            self[ModalPresentationModeKey.self]
        }
        set {
            self[ModalPresentationModeKey.self] = newValue
        }
    }
}
