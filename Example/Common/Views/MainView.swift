//
//  MainView.swift
//  Example
//
//  Created by Jan Kaltoun on 18/05/2020.
//  Copyright © 2020 Jan Kaltoun. All rights reserved.
//

import SwiftUI

struct MainView: View {
    enum SomethingIdentifiable: Int, Identifiable {
        case llama = 1
        
        var id: Int {
            rawValue
        }
    }
    
    @State var firstModalIsDisplayed = false
    @State var somethingIdentifiable: SomethingIdentifiable? = nil
    
    var body: some View {
        VStack {
            Button(action: { self.firstModalIsDisplayed = true }) {
                Text("First modal")
            }
            
            Button(action: { self.somethingIdentifiable = .llama }) {
                Text("Second modal")
            }
        }
        .modal(isPresented: $firstModalIsDisplayed) {
            FirstDetailView(isDisplayed: $firstModalIsDisplayed)
        }
        .modalStyle(FancyModalStyle())
        .modal(item: $somethingIdentifiable) { item in
            SecondDetailView()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
