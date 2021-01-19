//
//  Master.swift
//  Reader
//
//  Created by Legolas on 2021-01-12.
//

import SwiftUI

// MARK: - View
struct Master: View {
    @StateObject var data = Data()
    
    var body: some View {
        NavigationView {
            List(data.articles) { article in
                NavigationLink(destination: Detail(article: article)) {
                    Row(article: article)
                }
            }
            .navigationTitle("编辑推荐")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Master()
    }
}
