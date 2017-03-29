//
//  CollectionViewDelegatePV.swift
//  CustomUICollectionView
//
//  Created by Manuel Mouta on 27/03/17.
//  Copyright © 2017 Manuel Mouta. All rights reserved.
//
import UIKit

protocol  CollectionViewDelegatePV {
    
    func getListOfProductsSize()                                    -> Int
    func getProductAtIndex(index : Int)                             -> (String)
    func cellAtIndexTapped(cell  : CollectionViewCell, index : Int) -> Void
}
