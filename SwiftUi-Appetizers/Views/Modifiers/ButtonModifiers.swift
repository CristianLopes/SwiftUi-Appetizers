//
//  ButtonModifiers.swift
//  SwiftUi-Appetizers
//
//  Created by Cristian Cris on 17/10/23.
//

import SwiftUI

struct StandardButtonStyle : ViewModifier {

    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(.brandPrimary)
            .controlSize(.large)
    }
}
