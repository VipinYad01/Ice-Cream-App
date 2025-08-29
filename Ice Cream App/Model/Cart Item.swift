//
//  Cart Item.swift
//  Ice Cream App
//
//  Created by vipin on 04/06/25.
//

import Foundation

class CartManager: ObservableObject {
    struct CartItem: Identifiable {
        let id = UUID()
        let name: String
        let image: String
        let price: Double
        let type: String
    }

    @Published var cartItems: [CartItem] = []

    func addToCart(name: String, image: String, price: Double , type: String) {
        let item = CartItem(name: name, image: image, price: price, type: type)
        cartItems.append(item)
    }

    func totalAmount() -> Double {
        cartItems.reduce(0) { $0 + $1.price }
    }

    func clearCart() {
        cartItems.removeAll()
    }
    
    func removeItem(iiid: UUID) {
        cartItems.removeAll { $0.id == iiid }
    }

}

