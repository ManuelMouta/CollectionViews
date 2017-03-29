//
//  CellData.swift
//  CustomUICollectionView
//
//  Created by Manuel Mouta on 27/03/17.
//  Copyright © 2017 Manuel Mouta. All rights reserved.
//

import Foundation

struct Product {
    var productName  : String?
    var productPrice : Double?
    
    typealias callback = (ProductDelegateMP) -> Void
    
    init(completion: @escaping callback){
        completion(self)
    }
    
    init(productName : String, productPrice : Double){
        self.productName  = productName
        self.productPrice = productPrice
    }
}

extension Product : ProductDelegateMP{
    func loadData() -> [Product] {
        let product1  = Product(productName: "Frango",productPrice: 10)
        let product2  = Product(productName: "Milho",productPrice: 8)
        let product3  = Product(productName: "Pato",productPrice: 22)
        let product4  = Product(productName: "Bifanas",productPrice: 4)
        let product5  = Product(productName: "Bananas",productPrice: 7.8)
        let product6  = Product(productName: "Queijo",productPrice: 4.2)
        let product7  = Product(productName: "Uvas",productPrice: 1.3)
        let product8  = Product(productName: "Borrego",productPrice: 56.8)
        let product9  = Product(productName: "Atum",productPrice: 7)
        let product10 = Product(productName: "Peru",productPrice: 13)
        
        var listOfProducts : [Product] = [Product]()
        listOfProducts.append(product1)
        listOfProducts.append(product2)
        listOfProducts.append(product3)
        listOfProducts.append(product4)
        listOfProducts.append(product5)
        listOfProducts.append(product6)
        listOfProducts.append(product7)
        listOfProducts.append(product8)
        listOfProducts.append(product9)
        listOfProducts.append(product10)
        
        return listOfProducts
    }
}
