//
//  Data.swift
//  Reader
//
//  Created by Legolas on 2021-01-13.
//

import SwiftUI

// MARK: - Model
struct Article: Codable, Identifiable {
    var id: Int
    var title: String
    var body: String
}


// MARK: - ViewModel
// Rename
class Data: ObservableObject {
    @Published var articles = [Article]()
    
    init() {
        let url = URL(string: "https://www.legolas.me/s/articles.json")!
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                self.articles = try! JSONDecoder().decode([Article].self, from: data!)
            }
        }.resume()
    }
}








