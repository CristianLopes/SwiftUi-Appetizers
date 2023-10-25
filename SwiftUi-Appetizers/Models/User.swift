//
//  User.swift
//  SwiftUi-Appetizers
//
//  Created by Cristian Cris on 16/10/23.
//

import Foundation

struct User : Codable {
    var firstName = ""
    var lastName = ""
    var email = ""
    var birthdate = Date()
    var extraNapkins = false
    var frequentRefills = false
}
