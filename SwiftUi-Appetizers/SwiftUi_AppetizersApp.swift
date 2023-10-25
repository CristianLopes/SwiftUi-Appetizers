//
//  SwiftUi_AppetizersApp.swift
//  SwiftUi-Appetizers
//
//  Created by Cristian Cris on 22/09/23.
//

import SwiftUI

@main
struct SwiftUi_AppetizersApp: App {
    
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView()
                .environmentObject(order)
                .onAppear{
                    order.retrieve()
                }
        }
        
    }
}
