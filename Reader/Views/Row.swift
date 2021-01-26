//
//  Row.swift
//  Reader
//
//  Created by Legolas on 2021-01-13.
//

import SwiftUI

struct Row: View {
    var article: Article
    @EnvironmentObject var motion: MotionManager
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(article.title)
                .font(.title3)
                .bold()
                .padding(.bottom, 3)
                .scaleEffect(max(1, -motion.y * 1.2))
            Text(article.body)
                .lineLimit(3)
                .scaleEffect(max(1, -motion.y * 1.05))
        }
        .padding(.vertical)
    }
}

struct Row_Previews: PreviewProvider {
    static var previews: some View {
        Row(article: Article(id: 1, title: "标题", body: "正文"))
    }
}