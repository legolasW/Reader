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
            Row(article: article)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
