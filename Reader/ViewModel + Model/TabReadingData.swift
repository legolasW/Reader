//
//  TabReadingData.swift
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
class TabReadingData: ObservableObject {
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





/*
 VStack {
     if let price = product.price, product.isLocked {
         HStack() {
             Button(action: {
                 if let product = store.product(for: product.id) {
                     store.purchaseProduct(product)
                 }
             }, label: {
                 Text(price)
                     .padding(.vertical, 5)
                     .padding(.horizontal, 15)
                     .foregroundColor(.orange)
                     .cornerRadius(12)
                     .overlay(
                         RoundedRectangle(cornerRadius: 6)
                             .stroke(Color.orange, lineWidth: 2)
                     )
                     .padding(.vertical, 10)
                     .font(Font.system(size: 19, weight: .semibold))
             })
             .buttonStyle(PlainButtonStyle())
             Spacer()
             Button(action: { store.restorePurchases() }, label: {
                 Text("恢复购买")
                     .font(.headline)
                     .foregroundColor(.orange)
             })
             .buttonStyle(PlainButtonStyle())
         }
     }
 }
 */


