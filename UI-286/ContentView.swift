//
//  ContentView.swift
//  UI-286
//
//  Created by nyannyan0328 on 2021/08/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader{proxy in

            let bottomEge = proxy.safeAreaInsets.bottom

            Home(bottomEge: bottomEge)
                .ignoresSafeArea(.all, edges: .bottom)
        }
        .overlay(
        
        DisneySplash()
        
        )
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
