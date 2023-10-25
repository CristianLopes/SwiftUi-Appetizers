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
                VStack{                    
                    if !viewModel.isLoading && viewModel.appetizers.isEmpty {
                        OrderEmptyState()
                    } else {
                        List(viewModel.appetizers, id: \.id ){ appetizer in
                            AppetizerListCell(appetizer: AppetizerModel(appetizer:  appetizer))
                                .onTapGesture {
                                    viewModel.isShowingDetail = true
                                    viewModel.selectedAppetizer = appetizer
                                }
                        }
                        .listStyle(InsetListStyle())
                        .disabled(viewModel.isShowingDetail)
                    }
                }
                .navigationTitle("🍔 Appetizers")
            }
            
            .task {
                await viewModel.getAppetizersAsync()
            }
            .blur(radius: viewModel.isShowingDetail ? 20 : 0)
            
            if  viewModel.isShowingDetail {
                AppetizerDetailView(appetizer: AppetizerModel(appetizer:  viewModel.selectedAppetizer!), isShowingDetail: $viewModel.isShowingDetail )
            }
            
            if viewModel.isLoading {
                ProgressView().progressViewStyle(.circular)
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
