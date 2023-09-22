//
//  LoadingView.swift
//  SwiftUi-Appetizers
//
//  Created by Cristian Cris on 15/10/23.
//

import SwiftUI

struct ActivityIndicator : UIViewRepresentable {
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        
        let activityIndicatorView = UIActivityIndicatorView(style: .large)
        activityIndicatorView.color = UIColor.green
        activityIndicatorView.startAnimating()
        return activityIndicatorView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
    }
}

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea(.all)
            
            ActivityIndicator()
        }
    }
}

#Preview {
    LoadingView()
}
