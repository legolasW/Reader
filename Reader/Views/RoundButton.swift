//
//  RoundButton.swift
//  Reader
//
//  Created by Legolas on 2021-02-01.
//

import SwiftUI

struct RoundButton: View {
    let text: String
    let image: String
    
    var body: some View {
        HStack {
            Text(text)
            Image(systemName: image)
        }
        .font(.headline)
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
        .foregroundColor(.white)
        .background(Color.accentColor)
        .cornerRadius(10)
    }
}

struct RoundButton_Previews: PreviewProvider {
    static var previews: some View {
        RoundButton(text: "目的地", image: "circle")
    }
}
