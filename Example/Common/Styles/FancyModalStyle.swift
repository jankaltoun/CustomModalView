//
//  FancyModalStyle.swift
//  Example_iOS
//
//  Created by Jan Kaltoun on 18/05/2020.
//  Copyright © 2020 Jan Kaltoun. All rights reserved.
//

import SwiftUI
import CustomModalView

struct FancyModalStyle: ModalStyle {
    let animation: Animation? = .easeInOut(duration: 0.5)
    
    func makeBackground(configuration: ModalStyle.BackgroundConfiguration, isPresented: Binding<Bool>) -> some View {
        configuration.background
            .edgesIgnoringSafeArea(.all)
            .foregroundColor(.blue)
            .opacity(0.3)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .zIndex(1000)
    }
    
    func makeModal(configuration: ModalStyle.ModalContentConfiguration, isPresented: Binding<Bool>) -> some View {
        configuration.content
            .background(Color.yellow)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .zIndex(1001)
    }
}
