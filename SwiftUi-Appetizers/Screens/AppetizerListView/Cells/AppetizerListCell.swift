    //
    //  AppetizerListCell.swift
    //  SwiftUi-Appetizers
    //
    //  Created by Cristian Cris on 22/09/23.
    //

    import SwiftUI

    struct AppetizerListCell: View {

    let appetizer: Appetizer

    var body: some View {
            HStack(){
                AsyncImage(url: URL(string: appetizer.imageURL)) { image in
                    image.resizable()
                } placeholder: {
                    Image("food-placeholder")
                        .resizable()
                    //ProgressView().progressViewStyle(.circular)
                }
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 90 )
                    .cornerRadius(8)
                
                VStack(alignment:.leading, spacing: 5){
                    Text(appetizer.name)
                        .font(.title2)
                        .fontWeight(.medium)
                    
                    Text("$\(appetizer.price, specifier:"%.2f")")
                        .foregroundColor(.secondary)
                        .fontWeight(.semibold)
                }
                .padding(.leading)
            }
        }
    }

#Preview {
    AppetizerListCell(appetizer: MockData.sampleAppetizer)
}
