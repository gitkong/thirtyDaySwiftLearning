//
//  ViewController.swift
//  Video playground
//
//  Created by clarence on 16/8/28.
//  Copyright © 2016年 clarence. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: FLVideoPlayViewController {
    
    var playerItem : AVPlayerItem!
    
    var player : AVPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        
        
        // 1.创建播放器层
        let url = NSURL.init(fileURLWithPath: NSBundle.mainBundle().pathForResource("video.bundle/moments.mp4", ofType: nil)!)
        
        self.fl_alwaysRepeat = true
        self.fl_contentUrl = url
        
    }
    

}

