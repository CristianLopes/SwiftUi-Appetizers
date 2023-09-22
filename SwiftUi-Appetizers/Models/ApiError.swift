//
//  ApiError.swift
//  SwiftUi-Appetizers
//
//  Created by Cristian Cris on 22/09/23.
//

import Foundation

enum ApiError : Error {
    case invalidURL
    case invalidReponse
    case invalidData
    case unableToComplete
}
