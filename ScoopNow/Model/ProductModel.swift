//
//  ProductModel.swift
//  Ice Cream App
//
//  Created by vipin on 07/04/25.
//

import Foundation

struct ProductView : Identifiable{
    var id = UUID().uuidString
    var name : String
    var category : String
    var image : String
    var price : CGFloat
        
}

var productList: [ProductView] = [
    ProductView(name: "Strawberry Cheesecake", category: "Fruity", image: "n", price: 11.49),
    ProductView(name: "Salted Caramel Almond", category: "Nutty", image: "m", price: 12.99),
    ProductView(name: "Red Velvet", category: "Dessert", image: "l", price: 11.75),
    ProductView(name: "Pralines N Cream", category: "Nutty", image: "k", price: 10.95),
    ProductView(name: "Mocha Almond Fudge", category: "Coffee", image: "i", price: 12.89),
    ProductView(name: "Fresh Chikoo", category: "Fruity", image: "f", price: 9.99),
    ProductView(name: "Choco Hazelnut", category: "Chocolate", image: "h", price: 11.59),
    ProductView(name: "Caramel Crunch", category: "Caramel", image: "f", price: 10.49),
    ProductView(name: "Double Chocolate", category: "Chocolate", image: "j", price: 12.25),
    ProductView(name: "Fresh Strawberry", category: "Fruity", image: "b", price: 10.15),
    ProductView(name: "Fresh Mango", category: "Fruity", image: "p", price: 9.49),
    ProductView(name: "Tender Coconut", category: "Fruity", image: "a", price: 8.99),
    ProductView(name: "Cookie N Cream", category: "Cookies", image: "e", price: 11.79),
    ProductView(name: "Caffe Latte", category: "Coffee", image: "o", price: 12.69),
    ProductView(name: "Chocolate Low Calorie", category: "Chocolate", image: "g", price: 10.75),
    ProductView(name: "Vanilla Low Calorie", category: "Vanilla", image: "c", price: 9.89),
    ProductView(name: "Belgian Cookies Fudge", category: "Cookies", image: "q", price: 13.49),
    ProductView(name: "Fig & Honey", category: "Fruity", image: "r", price: 9.89)
]




struct SticksView : Identifiable{
    var id = UUID().uuidString
    var name : String
    var image : String
    var price : CGFloat
        
}


var SticksList: [SticksView] = [
    SticksView(name: "Icy Licks Orange", image: "aa", price: 2.49),
    SticksView(name: "Icy Licks Milky Mango", image: "bb", price: 2.79),
    SticksView(name: "Icy Twist Lemon Orange Cola", image: "cc", price: 2.99),
    SticksView(name: "Icy Twist Pineapple Raspberry Peach", image: "dd", price: 3.49),
    SticksView(name: "Sacch Mucch Aam", image: "ee", price: 2.59),
    SticksView(name: "Sacch Mucch Strawberry", image: "ff", price: 2.89),
    SticksView(name: "Sacch Mucch Fruit Cocktail", image: "gg", price: 3.19),
    SticksView(name: "Sacch Mucch Fruit Punch", image: "hh", price: 3.29),
    SticksView(name: "Lagoon Slush", image: "ii", price: 2.69),
    SticksView(name: "Mango Fruit Creme", image: "jj", price: 3.39),
    SticksView(name: "Strawberry Fruit Creme", image: "kk", price: 3.49),
    SticksView(name: "Centre Treat", image: "ll", price: 3.59),
    SticksView(name: "Triple Treat", image: "mm", price: 3.89),
    SticksView(name: "Butterscotch Caramel", image: "nn", price: 3.19),
    SticksView(name: "Fruit & Nut", image: "oo", price: 3.25),
    SticksView(name: "Choco Vanilla", image: "pp", price: 2.95),
    SticksView(name: "Choco Vanilla Duo", image: "qq", price: 3.45),
    SticksView(name: "Vanilla Almond", image: "rr", price: 3.75),
    SticksView(name: "Caramel Peanuts", image: "ss", price: 3.35),
    SticksView(name: "Kesar Badam Kulfi", image: "tt", price: 3.15),
    SticksView(name: "Rabri Malai Kulfi", image: "uu", price: 3.55),
    SticksView(name: "Royal Rajwadi Kulfi", image: "vv", price: 3.89),
    SticksView(name: "Rajbhog Kulfi", image: "ww", price: 3.45),
    SticksView(name: "Kewra Kulfi", image: "xx", price: 3.05),
    SticksView(name: "Pista Kulfi", image: "yy", price: 3.25)
]






struct TubsView : Identifiable{
    var id = UUID().uuidString
    var name : String
    var image : String
    var price : CGFloat
        
}

var TubsList: [TubsView] = [
    TubsView(name: "Chocolate", image: "a3", price: 10.49),
    TubsView(name: "Butterscotch", image: "b3", price: 10.79),
    TubsView(name: "Belgian Chocolate", image: "c3", price: 11.25),
    TubsView(name: "Chocolate Choco Chip", image: "d3", price: 11.89),
    TubsView(name: "Choco Brownie Fudge", image: "e3", price: 10.99),
    TubsView(name: "Kesari Rajbhog", image: "f3", price: 11.49),
    TubsView(name: "Shahi Kulfi", image: "g3", price: 12.10),
    TubsView(name: "French Vanilla", image: "h3", price: 12.29),
    TubsView(name: "Caramel Butterscotch", image: "i3", price: 10.95)
    ]





struct ConesView : Identifiable{
    var id = UUID().uuidString
    var name : String
    var image : String
    var price : CGFloat
        
}

var ConesList: [ConesView] = [
    ConesView(name: "Choco Fudge", image: "a1", price: 2.49),
    ConesView(name: "Nutty Chocolate", image: "b1", price: 2.79),
    ConesView(name: "Nutty Butterscotch", image: "c1", price: 2.59),
    ConesView(name: "Bourbon Truffle", image: "d1", price: 2.99),
    ConesView(name: "Cappuccino Truffle", image: "e1", price: 2.69),
    ConesView(name: "Choco Vanilla", image: "f1", price: 2.89),
    ConesView(name: "Pista", image: "g1", price: 2.39),
    ConesView(name: "Royal Rajwadi", image: "h1", price: 2.95),
    ConesView(name: "Creme Raspberry", image: "i1", price: 2.79),
    ConesView(name: "Black Currant", image: "j1", price: 2.49),
    ConesView(name: "Cotton Candy", image: "k1", price: 2.59)
]







struct BarsView : Identifiable{
    var id = UUID().uuidString
    var name : String
    var image : String
    var price : CGFloat
        
}

var BarsList: [BarsView] = [
    BarsView(name: "Sandwich Vanilla", image: "a2", price: 5.49),
    BarsView(name: "Sandwich Choco Vanilla", image: "b2", price: 5.69),
    BarsView(name: "Snack-O-Bar Bourbon", image: "c2", price: 5.79),
    BarsView(name: "Snack-O-Bar Caramel Peanut", image: "d2", price: 5.59)
]
