//
//  SecondDetailView.swift
//  Example
//
//  Created by Jan Kaltoun on 18/05/2020.
//  Copyright © 2020 Jan Kaltoun. All rights reserved.
//

import SwiftUI
import CustomModalView

struct SecondDetailView: View {
    @Environment(\.modalPresentationMode) var modalPresentationMode: Binding<ModalPresentationMode>
    
    var body: some View {
        VStack(spacing: 16) {
            Text("I'm a simple modal")
            
            Button(action: {
                self.modalPresentationMode.wrappedValue.dismiss()
            }) {
                Text("Dismiss")
            }
        }
        .padding()
    }
}

struct SecondDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SecondDetailView()
    }
}
