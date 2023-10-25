//
//  AppetizersListViewModel.swift
//  SwiftUi-Appetizers
//
//  Created by Cristian Cris on 22/09/23.
//

import SwiftUI

@MainActor
final class AppetizersListViewModel: ObservableObject {
    
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading: Bool = false
    @Published var isShowingDetail: Bool = false
    @Published var selectedAppetizer: Appetizer?
    
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
    
    func getAppetizersAsync() async {
        isLoading = true
        
        do {
            appetizers = try await NetworkManager.shared.getAppetizerAsync()
            isLoading = false
        }
        catch {
            if let apiError = error as? ApiError {
                switch apiError {
                    
                case .invalidData:
                    alertItem = AlertContext.invalidData
                case .invalidURL:
                    alertItem = AlertContext.invalidUrl
                case .invalidReponse:
                    alertItem = AlertContext.invalidResponse
                case .unableToComplete:
                    alertItem = AlertContext.unableToComplete
                }
            }
            else {
                alertItem = AlertContext.invalidResponse
            }
            
            isLoading = false
        }
    }
}
