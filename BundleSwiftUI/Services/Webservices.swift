//
//  Webservices.swift
//  BundleSwiftUI
//
//  Created by İbrahim Ay on 12.02.2024.
//

import Foundation

class Webservices: ObservableObject {
    static let shared = Webservices()
    
    func downloadNews(url: URL, completion: @escaping ([Articles]?) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                let response = try? JSONDecoder().decode(NewsModel.self, from: data)
                completion(response?.articles)
            }
        }.resume()
    }
}
