//
//  FLModel.swift
//  Day5-Carousel Effect
//
//  Created by 孔凡列 on 16/7/9.
//  Copyright © 2016年 clarence. All rights reserved.
//

import Foundation

class FLModel{
    var title : String?
    var imageName : String?
    
    init(title : String , imageName : String){
        self.title = title
        self.imageName = imageName;
    }
    
    static func creatModelArr() -> [FLModel]{
        
        return [
            FLModel.init(title: "你", imageName: "blue"),
            FLModel.init(title: "四", imageName: "bodyline"),
            FLModel.init(title: "不", imageName: "darkvarder"),
            FLModel.init(title: "四", imageName: "dudu"),
            FLModel.init(title: "傻", imageName: "hello"),
            FLModel.init(title: "啊", imageName: "hhhhh"),
            FLModel.init(title: "哈", imageName: "run"),
            FLModel.init(title: "哟", imageName: "wave")
                ]
    }
}
