//
//  MainView.swift
//  PictureApp
//
//  Created by Vitaly on 06.05.2023.
//

import SwiftUI
import Kingfisher

struct MainView: View {
    @ObservedObject var model = PictureViewModel()
    @State var page: Int = 10
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                switch model.status.process {
                case .error:
                    ErrorView(title: model.status.description)
                case .success:
                    PicturesFeed(
                        page: $page,
                        pictures: model.pictures,
                        loadData: { model.loadData(page: page) }
                    )
                case .preparing:
                    LoadingView(title: "Загружаем данные")
                }
            }
            .navigationTitle("Unsplash Pictures")
        }
    }
}

private struct PicturesFeed: View {
    @Binding var page: Int

    let pictures: [Picture]
    let loadData: () -> Void

    let columns = [ GridItem(spacing: 0), GridItem(spacing: 0) ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 0) {
                ForEach(pictures) { picture in
                    NavigationLink(destination: PictureDetails(url: URL(string: picture.links.full))) {
                        KFImage(URL(string: picture.links.thumb))
                            .placeholder{
                                LoadingView(title: "Loading...")
                            }
                            .fade(duration: 0.25)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(minWidth: UIScreen.main.bounds.size.width / 2.05)
                            .cornerRadius(14)
                            .onAppear {
                                if pictures.last == picture {
                                    page += 1
                                    loadData()
                                }
                            }
                    }
                }
                .padding(2)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
