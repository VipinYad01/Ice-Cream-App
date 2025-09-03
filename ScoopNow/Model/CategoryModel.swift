//
//  CategoryModel.swift
//  Ice Cream App
//
//  Created by vipin on 07/04/25.
//

import Foundation

struct CategoryView : Identifiable{
    var id = UUID().uuidString
    var title : String
        
}

var categoryList : [CategoryView] = [
    CategoryView(title: "All 🌟"),
    CategoryView(title: "Grapes 🍇"),
    CategoryView(title: "Choco 🍫"),
    CategoryView(title: "Vanilla 🍦"),
    CategoryView(title: "Strawberry 🍓"),
    CategoryView(title: "Butter Scotch 🍨"),
    CategoryView(title: "Mint 🍃")
]
