//
//  LoadingView.swift
//  PictureApp
//
//  Created by Vitaly on 06.05.2023.
//

import SwiftUI

struct LoadingView: View {
    let title: String
    
    var body: some View {
        VStack {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
            Text(title)
                .padding(.vertical, 10)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(title: "Loading")
    }
}
