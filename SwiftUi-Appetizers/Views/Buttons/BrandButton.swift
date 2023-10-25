//
//  BrandButton.swift
//  SwiftUi-Appetizers
//
//  Created by Cristian Cris on 15/10/23.
//

import SwiftUI

struct BrandButton: View {
    
    let title: LocalizedStringKey
    
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 260, height: 50)
            .foregroundColor(.white)
            .background(Color("brandPrimary"))
            .cornerRadius(10)
    }
}

#Preview {
    BrandButton(title: "$4.99 - Add to Order")
}
