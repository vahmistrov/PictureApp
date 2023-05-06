//
//  PictureDetails.swift
//  PictureApp
//
//  Created by Vitaly on 06.05.2023.
//

import SwiftUI
import Kingfisher

struct PictureDetails: View {
    @GestureState private var magnifyBy = CGFloat(1.0)
    @State private var totalScale = CGFloat(1.0)

    let url: URL?

    var body: some View {
        GeometryReader { geo in
            if let image = url {
                KFImage(image)
                    .placeholder{
                        LoadingView(title: "Loading...")
                    }
                    .fade(duration: 0.25)
                    .resizable()
                    .scaledToFit()
                    .scaleEffect(self.totalScale * self.magnifyBy)
                    .frame(width: geo.size.width, height: geo.size.height)
            }
        }
        .gesture(
            MagnificationGesture()
                .updating($magnifyBy) { currentState, gestureState, transaction in
                    gestureState = currentState
                }
                .onEnded { gestureScale in
                    if self.totalScale * gestureScale < 1.0 {
                        self.totalScale = 1.0
                    } else {
                        self.totalScale *= gestureScale
                    }
                }
        )
    }
}
