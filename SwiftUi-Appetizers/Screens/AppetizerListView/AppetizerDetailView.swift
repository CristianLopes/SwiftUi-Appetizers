//
//  AppetizerDetailView.swift
//  SwiftUi-Appetizers
//
//  Created by Cristian Cris on 15/10/23.
//

import SwiftUI

struct AppetizerDetailView: View {
    
    @EnvironmentObject var order: Order
    
    let appetizer: AppetizerModel
    @Binding var isShowingDetail: Bool
    
    var body: some View {
        ZStack {
            VStack{
                AsyncImage(url: URL(string: appetizer.imageURL)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 225)
                        
                } placeholder: {
                    ProgressView()
                        .scaleEffect(2)
                        .frame(width: 300, height: 225)
                        .progressViewStyle(.circular)
                }
                
                VStack {
                    Text(appetizer.name)
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text(appetizer.description)
                        .multilineTextAlignment(.center)
                        .font(.body)
                        .padding()
                    
                    HStack {
                        NutritionInfo(label: "Calories", description: "\(appetizer.calories)")
                        NutritionInfo(label: "Carbs", description: "\(appetizer.carbs)")
                        NutritionInfo(label: "Protein", description: "\(appetizer.protein)")
                    }
                }
                
                Spacer()
                
                Button {
                    order.add(appetizer: appetizer)
                    isShowingDetail = false
                } label: {
                    Text("$\(appetizer.price, specifier: "%.2f") - Add to Order")
                }
                .modifier(StandardButtonStyle())
                
                .padding(.bottom, 30)
            }
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay( Button(){
                isShowingDetail = false
            }label: {
                XDismissButton()
            }
            , alignment: .topTrailing)
    }
}

struct NutritionInfo : View {
    
    let label: String
    let description: String
    let spacing: CGFloat = 5
    
    var body: some View {
        VStack(spacing: spacing){
            Text(label)
                .bold()
                .font(.caption)
            
            Text(description)
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}



#Preview {
    AppetizerDetailView(appetizer: AppetizerModel(appetizer:  Appetizer(id: 0, name: "Chicken Wings", description: "You'll need extra napkins with these tasty treats.", price: 11.49, imageURL: "", calories: 700, protein: 11, carbs: 13)), isShowingDetail: .constant(true))
}
