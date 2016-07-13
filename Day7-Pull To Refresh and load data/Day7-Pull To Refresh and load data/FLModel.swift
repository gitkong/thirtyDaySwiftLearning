//
//  FLModel.swift
//  Day7-Pull To Refresh and load data
//
//  Created by 孔凡列 on 16/7/13.
//  Copyright © 2016年 clarence. All rights reserved.
//

import UIKit

class FLModel: NSObject {
    var name : String!
    
    init(dict:[String : AnyObject]){
        super.init()
        setValuesForKeysWithDictionary(dict)
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
}
