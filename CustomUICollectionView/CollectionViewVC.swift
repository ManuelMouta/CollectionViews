//
//  ViewController.swift
//  CustomUICollectionView
//
//  Created by Manuel Mouta on 27/03/17.
//  Copyright © 2017 Manuel Mouta. All rights reserved.
//

import UIKit

class CollectionViewVC: UIViewController{

    fileprivate var presenter : CollectionViewPresenter?
    var presenterDelegate     : CollectionViewDelegatePV?
    
    fileprivate let itemsPerRow: CGFloat = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = CollectionViewPresenter(self){ presenter in
            self.presenterDelegate = presenter
        }
        presenter?.viewDelegate = self
    }
    
}

extension CollectionViewVC : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        let numberOfItems = presenterDelegate?.getListOfProductsSize()
        return numberOfItems!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell                = collectionView.dequeueReusableCell(withReuseIdentifier: "collection_cell", for: indexPath) as! CollectionViewCell
        cell.labelProduct.text  = presenterDelegate?.getProductAtIndex(index: indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell            = collectionView.cellForItem(at: indexPath) as! CollectionViewCell
        presenterDelegate?.cellAtIndexTapped(cell: cell, index: indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout : UICollectionViewLayout,
                        sizeForItemAt indexPath     : IndexPath) -> CGSize {
        
        let paddingSpace : CGFloat  = 1.0
        let availableWidth          = view.frame.width - paddingSpace
        let widthPerItem            = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}

//Methods provided from view to presenter
extension CollectionViewVC : CollectionViewDelegateVP{
    func updateCoolectionCellAtIndex(index : Int)->Void{
        //No need
    }
}

