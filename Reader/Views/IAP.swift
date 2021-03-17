//
//  IAP.swift
//  Reader
//
//  Created by Legolas on 2021-03-16.
//

import SwiftUI

struct IAP: View {
    @StateObject var store = Store()
    
    var body: some View {
        ForEach(store.allProducts, id: \.self) { product in
            Group {
                if !product.isLocked {
                    Text("已解锁 Pro 版")
                } else {
                    if let price = product.price, product.isLocked {
                        HStack() {
                            Button(action: {
                                if let product = store.product(for: product.id) {
                                    store.purchaseProduct(product)
                                }
                            }) {
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
                            }
                            .buttonStyle(PlainButtonStyle())
                            
                            Spacer()
                            
                            Button(action: { store.restorePurchases() }) {
                                Text("恢复购买")
                                    .font(.headline)
                                    .foregroundColor(.orange)
                                
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    
                }
            }
        }
        .onAppear {
            store.loadStoredPurchases()
        }
    }
}

