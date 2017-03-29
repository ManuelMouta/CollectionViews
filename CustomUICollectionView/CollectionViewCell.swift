//
//  CollectionViewCell.swift
//  CustomUICollectionView
//
//  Created by Manuel Mouta on 27/03/17.
//  Copyright © 2017 Manuel Mouta. All rights reserved.
//

import UIKit

class CollectionViewCell : UICollectionViewCell {
    @IBOutlet weak var imageProduct: UIImageView!
    @IBOutlet weak var labelProduct: UILabel!
    var isDetailShown : Bool = false
    
    func addProductPriceViewToCell(productPrice : Double){
        ////////////
        let subview = self.contentView.subviews
        DebugHelper.consolePrintValues(values: [subview])
        ////////////
        let viewOverCell                = UIView.init(frame:CGRect.init(x: 0, y: 0, width: self.frame.width, height: self.frame.width))
        viewOverCell.backgroundColor    = getRandomColor()
        let label                       = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 30))
        //label.center                  = CGPoint(x: self.frame.midX, y: self.frame.midY)
        label.textAlignment             = .center
        label.text                      = String(format:"%.1f", productPrice)
        viewOverCell.addSubview(label)
        UIView.transition(with: self, duration: 1.0, options: UIViewAnimationOptions.transitionFlipFromLeft,
                          animations: {self.contentView.addSubview(viewOverCell)}, completion: nil)
        //UIView.animate(withDuration: 1, delay: 0.5, usingSpringWithDamping: <#T##CGFloat#>, initialSpringVelocity: <#T##CGFloat#>, options: <#T##UIViewAnimationOptions#>, animations: <#T##() -> Void#>, //completion: <#T##((Bool) -> Void)?##((Bool) -> Void)?##(Bool) -> Void#>)
    }
    
    func getRandomColor() -> UIColor{
        let red:CGFloat = CGFloat(drand48())
        let green:CGFloat = CGFloat(drand48())
        let blue:CGFloat = CGFloat(drand48())
        
        return UIColor(red:red, green: green, blue: blue, alpha: 1.0)
    }
}
