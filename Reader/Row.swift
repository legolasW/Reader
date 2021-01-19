//
//  Row.swift
//  Reader
//
//  Created by Legolas on 2021-01-13.
//

import SwiftUI

struct Row: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("人")
                .font(.title3)
                .bold()
                .padding(.bottom, 3)
            Text("世界太吵闹了。当你静下来听这个世界的时候，却发现杂音太大以至于听不到自己的心声，我们是当代的失聪者吗？忧虑的事情太多，掩盖了本心。真正想做的事，别人又会在真正在乎吗？有人会，确实难。人的孤独，大概就是发现大多数人的存在的确是孤岛。\n\n坏人值得同情吗？")
                .lineLimit(3)
        }
    }
}

struct Row_Previews: PreviewProvider {
    static var previews: some View {
        Row()
    }
}
