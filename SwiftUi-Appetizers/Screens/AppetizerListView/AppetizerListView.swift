//
//  AppetizerListView.swift
//  SwiftUi-Appetizers
//
//  Created by Cristian Cris on 22/09/23.
//

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject var viewModel: AppetizersListViewModel = AppetizersListViewModel()
    
    var body: some View {
        ZStack {
            NavigationView {
                List(viewModel.appetizers, id: \.id ){ appetizer in
                    AppetizerListCell(appetizer: appetizer)
                }
                .listStyle(InsetListStyle())
                .navigationTitle("🍔 Appetizers")
            }
            .onAppear{
                viewModel.getAppetizers()
            }
            
            if viewModel.isLoading {
                LoadingView()
            }
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title:  Text(alertItem.title),
                  message: Text(alertItem.message),
                  dismissButton: alertItem.dismissButton)
        }
    }
}

#Preview {
    AppetizerListView()
}
