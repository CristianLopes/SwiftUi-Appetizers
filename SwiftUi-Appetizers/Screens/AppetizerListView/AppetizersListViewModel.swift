//
//  AppetizersListViewModel.swift
//  SwiftUi-Appetizers
//
//  Created by Cristian Cris on 22/09/23.
//

import SwiftUI

final class AppetizersListViewModel: ObservableObject {
    
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading: Bool = false
    
    
    func getAppetizers() {
        isLoading = true
        NetworkManager.shared.getAppetizers { [self] result in
            DispatchQueue.main.async {
                self.isLoading = false
                
                switch result {
                case .success(let appetizers):
                    self.appetizers = appetizers
                case .failure(let error):
                    switch error {
                    case .invalidData:
                        self.alertItem = AlertContext.invalidData
                    case .invalidURL:
                        self.alertItem = AlertContext.invalidUrl
                    case .invalidReponse:
                        self.alertItem = AlertContext.invalidResponse
                    case .unableToComplete:
                        self.alertItem = AlertContext.unableToComplete
                    }
                }
            }
        }
    }
}
