//
//  PikturesViewModel.swift
//  PictureApp
//
//  Created by Vitaly on 06.05.2023.
//

import Foundation

class PictureViewModel: ObservableObject {
    @Published var pictures: [Picture] = []

    init() { loadData() }

    func loadData(page: Int = 10) {
        let url = "\(Constant.baseUrl)photos/?page=\(page)&per_page=30&client_id=\(Constant.clientId)"
        
        let session = URLSession(configuration: .default)
        session.dataTask(with: URL(string: url)!) { (data, _, error) in
            guard let data = data else { return }

            do {
                let json = try JSONDecoder().decode([Picture].self, from: data)
                for photo in json {
                    DispatchQueue.main.async {
                        self.pictures.append(photo)
                    }
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
