//
//  ContentView.swift
//  Reader
//
//  Created by Legolas on 2021-01-12.
//

import SwiftUI

// MARK: - View
struct ContentView: View {
    @StateObject var data = Data()
    
    var body: some View {
        List(data.articles) { article in
            VStack(alignment: .leading) {
                Text(article.title)
                    .font(.title3)
                    .bold()
                    .padding(.bottom, 3)
                Text(article.body)
                    .lineLimit(3)
            }
            .padding(.vertical)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
