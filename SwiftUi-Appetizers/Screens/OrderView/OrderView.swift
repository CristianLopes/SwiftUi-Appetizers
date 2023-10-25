//
//  OrderView.swift
//  SwiftUi-Appetizers
//
//  Created by Cristian Cris on 22/09/23.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView {
            VStack{
                if order.items.isEmpty {
                    OrderEmptyState()
                }
                else {
                    List{
                        ForEach(order.items) { item in
                            OrderCell(appetizer: item)
                        }
                        .onDelete(perform: deleteItem)
                    }
                    .listStyle(PlainListStyle())

                    Button {
                        order.placeOrder()
                    }label: {
                        Text( "\(order.totalPrice, specifier: "%.2f") - Place Order")
                    }
                    .modifier(StandardButtonStyle())
                    .padding(.bottom, 25)
                }
            }
            .navigationTitle("🧾 Orders")
        }
    }
    
    func deleteItem(indexPath: IndexSet ){
        order.remove(offset: indexPath)
    }
}

#Preview {
    OrderView()
}
