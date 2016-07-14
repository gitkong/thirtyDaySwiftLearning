//
//  ViewController.swift
//  Day8-Random Color Gradient
//
//  Created by 孔凡列 on 16/7/14.
//  Copyright © 2016年 clarence. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {

    var randomCol : CAGradientLayer = CAGradientLayer()
    
    var timer : NSTimer!

    var playMusicBtn : UIButton = UIButton()
    
    var flag : Bool = false
    
    
    var player: AVPlayer = AVPlayer.init(URL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Ecstasy", ofType: "mp3")!))
    
    var progressView : UIProgressView = UIProgressView(progressViewStyle: UIProgressViewStyle.Bar)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = UIColor.fl_sameRGB(255, alpha: 1.0)
        
        randomCol.frame = view.bounds
        randomCol.locations = [NSNumber(float: 0.0),NSNumber(float: 0.3),NSNumber(float: 0.6),NSNumber(float: 1.0),]
        randomCol.startPoint = CGPoint(x: 0.0,y: 0.0)
        randomCol.endPoint = CGPoint(x: 1.0,y: 1.0)
        view.layer.addSublayer(randomCol)
        changeColor()
        
        
        
        playMusicBtn.setBackgroundImage(UIImage(named:"music play"), forState:UIControlState.Normal)
        playMusicBtn.bounds = CGRect(x: 0, y: 0, width: (playMusicBtn.currentBackgroundImage?.size.width)!, height: (playMusicBtn.currentBackgroundImage?.size.height)!)
        playMusicBtn.fl_centerX = view.fl_centerX
        playMusicBtn.fl_centerY = view.fl_centerY
        playMusicBtn.addTarget(self, action: Selector("playMusic"), forControlEvents: UIControlEvents.TouchUpInside)
        view.addSubview(playMusicBtn)
        
        progressView.bounds = CGRect(x: 0, y: 0, width: 200, height: 15)
        progressView.fl_centerX = view.fl_centerX
        progressView.fl_centerY = playMusicBtn.fl_bottom + 10
        progressView.trackTintColor = UIColor.whiteColor()
        progressView.progressTintColor = UIColor.fl_randomColor()
        progressView.progress = 0.0
        view.addSubview(progressView)
    }
    
    func playMusic() {
        flag = !flag
        if flag {
            player.play()
            changeColor()
            timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("changeColor"), userInfo: nil, repeats: true)
            NSRunLoop.currentRunLoop().addTimer(timer, forMode: NSRunLoopCommonModes)
        }
        else{
            player.pause()
            timer.invalidate()
            timer = nil
        }
        
    }

    func changeColor() {
        randomCol.colors = [UIColor.fl_randomColor().CGColor,UIColor.fl_randomColor().CGColor,UIColor.fl_randomColor().CGColor,UIColor.fl_randomColor().CGColor]
        
        let progress = CMTimeGetSeconds(player.currentTime()) / CMTimeGetSeconds((player.currentItem?.duration)!)
        progressView.setProgress(Float(progress), animated: true)
        print(progress)
    }


}

