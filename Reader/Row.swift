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
            Text("世界太吵闹了。当你静下来听这个世界的时候，却发现杂音太大以至于听不到自己的心声，我们是当代的失聪者吗？忧虑的事情太多，掩盖了本心。真正想做的事，别人又会在真正在乎吗？有人会，确实难。人的孤独，大概就是发现大多数人的存在的确是孤岛。\n\n坏人值得同情吗？绝不，可惜这个世界心存坏水的人太多。曾经对社会的认知是纯粹的，理想化的，坏人是少的，做坏事是会被惩罚的。关注政治之后，顿觉人性本好纷争，短短几十年人能管好自己实属不易。政治，似乎是少看为好，会让人惊恐地意识到，原来偷摸砸抢只是小恶。\n\n逃避可耻且没用。道理我懂，自己做的也确实差，控制不住上网成瘾的心，却异常会找借口宽慰它，无力吐槽。怎么改？目标定小，胸怀天下，行于眼下，保持自信，拒绝琐碎。专注与持之以恒才是硬道理。")
                .lineLimit(3)
        }
    }
}

struct Row_Previews: PreviewProvider {
    static var previews: some View {
        Row()
    }
}
