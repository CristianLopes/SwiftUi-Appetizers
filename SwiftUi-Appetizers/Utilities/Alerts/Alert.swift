//
//  Alert.swift
//  SwiftUi-Appetizers
//
//  Created by Cristian Cris on 14/10/23.
//

import SwiftUI

struct AlertItem : Identifiable {
    let id = UUID()
    let title: String
    let message: String
    let dismissButton: Alert.Button
 }

struct AlertContext {
   
    static let invalidData = makeAlert(title: "Server Error", message: "The data received from the server was invalid. Please contact the support.")
   
    static let invalidResponse = makeAlert(title: "Server Error", message: "Invalid response from the server. Please try again later or contact support.")
    
    static let invalidUrl = makeAlert(title: "Server Error", message: "There was an issue connecting to the server. If this persists, please contact support.")
   
    static let unableToComplete = makeAlert(title: "Server Error", message: "Unable to complete your request at this time. Please check your internet connection.")
    
    static func makeAlert(title: String, message: String) -> AlertItem {
        return AlertItem(title: title, message: message, dismissButton: .default(Text("OK")))
    }
    
    //MARK - Alert Account Section
    static let invalidForm = makeAlert(title: "Invalid Form", message: "Please ensure all fields in the form have been filled out.")
    static let invalidEmail = makeAlert(title: "Invalid Email", message: "Please ensure your email is correct.")
    static let userSaveSuccess = makeAlert(title: "Profile Saved", message: "Your profile information was successfully saved.")
    static let invalidUserData = makeAlert(title: "Profile Error", message: "There was an error saving or retrieving your profile.")
}
