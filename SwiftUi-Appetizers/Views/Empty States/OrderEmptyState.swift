//
//  OrderEmptyState.swift
//  SwiftUi-Appetizers
//
//  Created by Cristian Cris on 17/10/23.
//

import SwiftUI
struct OrderEmptyState: View {
    
    let orderEmptyMessage = String(localized: "Orders Empty State");
    
    var body: some View {
        EmptyState(imageName: "empty-order",
                   message: orderEmptyMessage
        )
    }
}


#Preview {
    OrderEmptyState()
}
