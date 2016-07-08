//
//  ViewController.swift
//  Day1-Simple Stop Watch
//
//  Created by 孔凡列 on 16/7/8.
//  Copyright © 2016年 clarence. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let windowW = UIScreen.mainScreen().bounds.size.width
    
    let windowH = UIScreen.mainScreen().bounds.size.height
    
    var timeLabel : UILabel?
    
    var startBtn : UIButton?
    
    var stopBtn : UIButton?
    
    var restBtn : UIButton?
    
    var timer : NSTimer?
    
    var count : CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("hello world")
        
        timeLabel = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: windowW, height: windowH * 0.4))
        timeLabel?.text = "0.0"
        timeLabel?.font = UIFont.systemFontOfSize(40)
        timeLabel?.textColor = UIColor.whiteColor()
        timeLabel?.backgroundColor = UIColor.blackColor()
        timeLabel?.textAlignment = NSTextAlignment.Center
        self.view.addSubview(timeLabel!)
        
        restBtn = UIButton.init(frame: CGRect.init(x: windowW - 100, y: 20, width: 100, height: 30))
        restBtn?.setTitle("rest", forState: UIControlState.Normal)
        restBtn?.addTarget(self, action: Selector.init("rest"), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(restBtn!)
        
        startBtn = UIButton.init(frame: CGRect.init(x: 0, y: windowH * 0.4, width: windowW / 2, height: windowH * 0.6))
        startBtn?.backgroundColor = UIColor.blueColor()
        startBtn?.setTitle("开始", forState: UIControlState.Normal)
        startBtn?.addTarget(self, action: Selector.init("start"), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(startBtn!)
        
        stopBtn = UIButton.init(frame: CGRect.init(x: windowW / 2, y: windowH * 0.4, width: windowW / 2, height: windowH * 0.6))
        stopBtn?.backgroundColor = UIColor.greenColor()
        stopBtn?.setTitle("停止", forState: UIControlState.Normal)
        stopBtn?.addTarget(self, action: Selector.init("stop"), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(stopBtn!)
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func rest() {
        print("rest")
        startBtn?.setTitle("开始", forState: UIControlState.Normal)
        timeLabel?.text = "0.0"
        count = 0.0
        timer?.invalidate()
        timer = nil
    }
    
    func start() {
        print("start")
        
        if startBtn?.titleLabel?.text == "进行中" {
            print("进行中啊，等等哈")
        }
        else{
            startBtn?.setTitle("开始", forState: UIControlState.Normal)
            timer = NSTimer.init(timeInterval: 0.2, target: self, selector: Selector.init("counting"), userInfo: nil, repeats: true)
            NSRunLoop.currentRunLoop().addTimer(timer!, forMode: NSRunLoopCommonModes)
            timer?.fire()
            
            startBtn?.setTitle("进行中", forState: UIControlState.Normal)
        }
        
    }
    
    func stop() {
        print("stop")
        startBtn?.setTitle("开始", forState: UIControlState.Normal)
        timer?.invalidate()
        timer = nil
    }


    func counting() {
        count = count + 0.1
        timeLabel?.text = NSString(format: "%.1f",count) as String
    }
}

