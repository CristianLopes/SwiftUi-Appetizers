//
//  OrderCell.swift
//  SwiftUi-Appetizers
//
//  Created by Cristian Cris on 24/10/23.
//

import SwiftUI

struct OrderCell: View {
    @EnvironmentObject var order: Order
    @StateObject var appetizer: AppetizerModel
    
    var body: some View {
        HStack(){
            AsyncImage(url: URL(string: appetizer.imageURL)) { image in
                image.resizable()
            } placeholder: {
                Image("food-placeholder")
                    .resizable()
            }
            .aspectRatio(contentMode: .fit)
            .frame(width: 120, height: 90 )
            .cornerRadius(8)
            
            VStack(alignment:.leading, spacing: 5){
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                
                HStack{
                    Text("$\(appetizer.price, specifier:"%.2f")")
                        .foregroundColor(.secondary)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    HStack{
                        Button {
                            print("\(order.items.count)")
                            print("subtract")
                            order.subtract(appetizer: appetizer)
                        } label: {
                            Text("-")
                                .font(.title)
                        }
                        .buttonStyle(.bordered)
                        
                        
                        Text("\(appetizer.qtd)")
                            .foregroundColor(.secondary)
                            .fontWeight(.semibold)
                        
                        Button {
                            order.add(appetizer: appetizer)
                        }label: {
                            Text("+")
                                .font(.title)
                        }
                        .buttonStyle(.bordered)
                    }
                    .background(.green)
                }
            }
            .padding(.leading)
        }
    }
}



#Preview {
    OrderCell(appetizer: MockData.sampleAppetizer)
}
