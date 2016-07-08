//
//  ViewController.swift
//  Day2-Custom Font
//
//  Created by 孔凡列 on 16/7/8.
//  Copyright © 2016年 clarence. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var label : UILabel = {
        var label = UILabel.init(frame: CGRect.init(x: 100, y: 100, width: 200, height: 100))
        label.text = "hello world"
        label.font = UIFont.boldSystemFontOfSize(30)
        return label
    }()
    
    var btn : UIButton?
    
    var flag : Bool = false
     
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(label)
        
        btn = UIButton.init(frame: CGRect.init(x: 100, y: 400, width: 200, height: 30))
        btn?.backgroundColor = UIColor.blackColor()
        btn?.setTitle("点我改变字体", forState: UIControlState.Normal)
        btn?.addTarget(self, action: Selector.init("click"), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(btn!)
        
    }

    func click() {
        flag = (!flag)
        
        label.font = flag ? UIFont.init(name: "MicrosoftYaHei", size: 30) : UIFont.boldSystemFontOfSize(30)
        
        btn?.titleLabel?.font = flag ? UIFont.init(name: "MicrosoftYaHei", size: 14) : UIFont.boldSystemFontOfSize(14)
    }


}

