//
//  ErrorView.swift
//  PictureApp
//
//  Created by Vitaly on 06.05.2023.
//

import SwiftUI

struct ErrorView: View {
    let title: String
    var body: some View {
        VStack {
            Image(systemName: "xmark.square.fill")
                .resizable()
                .frame(width: 40, height: 40)
            Text(title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
        }
        .foregroundColor(.red)
        .padding(20)
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(title: "Ошибка")
    }
}
