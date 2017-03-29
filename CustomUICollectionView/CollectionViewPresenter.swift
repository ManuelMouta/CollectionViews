//
//  CollectionViewPresenter.swift
//  CustomUICollectionView
//
//  Created by Manuel Mouta on 27/03/17.
//  Copyright © 2017 Manuel Mouta. All rights reserved.
//

import Foundation
import UIKit

class CollectionViewPresenter{
    var listOfProducts                 : [Product]?
    var viewDelegate                   : CollectionViewDelegateVP?
    var modelDelegate                  : ProductDelegateMP?
    var product                        : Product?
    
    init(_ view : CollectionViewDelegateVP, completion: @escaping(CollectionViewDelegatePV)->Void){
        viewDelegate   = view
        product        = Product.init(){completion in
                                        self.modelDelegate = completion
        }
        listOfProducts = modelDelegate?.loadData()
        completion(self as CollectionViewDelegatePV)
    }
    
    func detachView(){
        self.viewDelegate = nil
    }
    
    
}

//Presenter Provided methods to View
extension CollectionViewPresenter : CollectionViewDelegatePV{
    
    func cellAtIndexTapped(cell: CollectionViewCell, index: Int) {
        let productPrice    = getPriceForProduct(index: index)
        DebugHelper.consolePrintValues(values: [productPrice ?? 0.0,index])
        if(!cell.isDetailShown){
            cell.addProductPriceViewToCell(productPrice: productPrice)
        }
        cell.isDetailShown  = true
        
    }

    func getProductAtIndex(index: Int) -> (String) {
        return (listOfProducts![index].productName!)
    }
    
    func getListOfProductsSize() -> Int{
        return (listOfProducts?.count)!
    }
    
    func getPriceForProduct(index : Int) -> (Double){
        return (listOfProducts![index].productPrice!)
    }
}


