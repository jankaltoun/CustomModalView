//
//  FirstDetailView.swift
//  Example
//
//  Created by Jan Kaltoun on 18/05/2020.
//  Copyright © 2020 Jan Kaltoun. All rights reserved.
//

import SwiftUI

struct FirstDetailView: View {
    @Binding var isDisplayed: Bool
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Nice modal, eh?")
                .font(.title)
            
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nec tellus pellentesque urna sollicitudin sagittis. Fusce sem justo, eleifend eget dignissim sed, convallis at velit.")
                .fixedSize(horizontal: false, vertical: true)
                .frame(width: 300)
            
            Button(action: { self.isDisplayed = false }) {
                Text("Dismiss")
            }
        }
        .padding()
    }
    
    init(isDisplayed: Binding<Bool>) {
        self._isDisplayed = isDisplayed
    }
}

struct FirstDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FirstDetailView(isDisplayed: .constant(true))
    }
}
