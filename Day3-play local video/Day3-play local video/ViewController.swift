//
//  ViewController.swift
//  Day3-play local video
//
//  Created by 孔凡列 on 16/7/8.
//  Copyright © 2016年 clarence. All rights reserved.
//

import UIKit
// 视频播放
import AVKit
import AVFoundation

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{

    var fl_tableView : UITableView?
    
    var playerView : AVPlayerViewController?
    
    var player : AVPlayer?
    
    lazy var dataArr : NSArray = {
        return ["videoScreenshot01","videoScreenshot02","videoScreenshot03","videoScreenshot04","videoScreenshot05","videoScreenshot06"]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        fl_tableView = UITableView.init(frame: self.view.bounds)
        fl_tableView?.delegate = self;
        fl_tableView?.dataSource = self;
        fl_tableView?.registerNib(UINib.init(nibName: "FLTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        fl_tableView?.separatorStyle = UITableViewCellSeparatorStyle.None
        self.view.addSubview(fl_tableView!)
        
        
        playerView = AVPlayerViewController.init()
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = fl_tableView!.dequeueReusableCellWithIdentifier("cell") as! FLTableViewCell
        let name : String = dataArr[indexPath.row] as! String
        cell.iconView.image = UIImage.init(named: name)
        return cell
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 300
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print(indexPath.row)
        let path = NSBundle.mainBundle().pathForResource("emoji zone.mp4", ofType: nil)
        player = AVPlayer.init(URL: NSURL.init(fileURLWithPath: path!))
        playerView?.player = player
        self.presentViewController(playerView!, animated: true) { () -> Void in
            self.player?.play()
            
        }
    }
    
}

