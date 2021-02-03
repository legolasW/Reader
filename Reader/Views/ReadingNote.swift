//
//  ReadingNote.swift
//  Reader
//
//  Created by Legolas on 2021-02-01.
//

import SwiftUI
import BetterSafariView

struct ReadingNote: View {
    @State private var presentingSafariView = false
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                    .frame(height: 20)
                HStack {
                    Link(destination: URL(string: "https://legolas.me")!) {
                        RoundButton(text: "在 Safari 打开", image: "safari")
                    }
                    
                    Button(action: {
                        presentingSafariView = true
                    }) {
                        RoundButton(text: "在本应用中打开", image: "arrow.up.forward.app")
                    }
                    .safariView(isPresented: $presentingSafariView) {
                        SafariView(
                            url: URL(string: "https://legolas.me")!,
                            configuration: SafariView.Configuration(
                                entersReaderIfAvailable: true,
                                barCollapsingEnabled: true
                            )
                        )
                        .preferredBarAccentColor(.clear)
                        .preferredControlAccentColor(.orange)
                        .dismissButtonStyle(.close)
                    }
                } // 浏览器跳转
                NoteEntryAndList()
            }
            .navigationTitle("笔记")
        }
    }
}

struct ReadingNote_Previews: PreviewProvider {
    static var previews: some View {
        ReadingNote()
    }
}
