//
//  DebugHelper.swift
//  CustomUICollectionView
//
//  Created by Manuel Mouta on 28/03/17.
//  Copyright © 2017 Manuel Mouta. All rights reserved.
//

import Foundation

struct DebugHelper {
    
    static func consolePrintValues(values : [Any]){
        print("DEBUGGER HELPER")
        for value in values {
            print("#################### \(String(describing : value)) = \(value) ####################")
        }
    }
    
}
