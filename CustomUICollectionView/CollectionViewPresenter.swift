//
//  CollectionViewPresenter.swift
//  CustomUICollectionView
//
//  Created by Manuel Mouta on 27/03/17.
//  Copyright © 2017 Manuel Mouta. All rights reserved.
//

import Foundation

class CollectionViewPresenter{
    var listOfProducts                 : [Product]?
    fileprivate var viewDelegate       : CollectionViewDelegateVP?
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

extension CollectionViewPresenter : CollectionViewDelegatePV{
    
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
