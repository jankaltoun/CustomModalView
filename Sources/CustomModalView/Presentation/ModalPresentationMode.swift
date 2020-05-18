//
//  ModalPresentationMode.swift
//  
//
//  Created by Jan Kaltoun on 18/05/2020.
//

import SwiftUI

public struct ModalPresentationMode {
    let underlyingBinding: Binding<Bool>
    
    public var isPresented: Bool {
        underlyingBinding.wrappedValue
    }
    
    public func dismiss() {
        underlyingBinding.wrappedValue = false
    }
}
