//
//  Detail.swift
//  Reader
//
//  Created by Legolas on 2021-01-18.
//

import SwiftUI

struct Detail: View {
    var article: Article
    
    var body: some View {
        Text(article.body)
    }
}

struct Detail_Previews: PreviewProvider {
    static var previews: some View {
        Detail(article: Article(id: 1, title: "标题", body: "正文"))
    }
}
