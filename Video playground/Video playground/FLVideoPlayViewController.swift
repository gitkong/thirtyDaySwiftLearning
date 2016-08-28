//
//  FLVideoPlayViewController.swift
//  Video playground
//
//  Created by clarence on 16/8/28.
//  Copyright © 2016年 clarence. All rights reserved.
//

import UIKit
import AVKit
import MediaPlayer

enum FLScaleMode {
    case Resize // 非均匀模式。两个维度完全填充至整个视图区域
    case ResizeAspect // 等比例填充，直到一个维度到达区域边界
    case ResizeAspectFill // 等比例填充，直到填充满整个视图区域，其中一个维度的部分区域会被裁剪
}

class FLVideoPlayViewController: UIViewController {
    
    // 创建播放器
    private let playerVc = AVPlayerViewController()
    private var moviePlayerSoundLevel : Float = 1.0
    
    // 监听url,有url才显示
    var fl_contentUrl = NSURL() {
        didSet {
            // 显示播放器的view
            self.showContent(fl_contentUrl)
        }
    }
    
    var fl_alwaysRepeat : Bool = true {
        didSet {
            if fl_alwaysRepeat {
                // 监听播放结束
                NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(FLVideoPlayViewController.playerItemDidReachEnd), name: AVPlayerItemDidPlayToEndTimeNotification, object: nil)
            }
        }
    }
    
    var fl_scaleMode : FLScaleMode = FLScaleMode.Resize {
        didSet {
            switch fl_scaleMode {
            case .Resize:
                playerVc.videoGravity = AVLayerVideoGravityResize
                break
            case .ResizeAspect:
                playerVc.videoGravity = AVLayerVideoGravityResizeAspect
                break
            case .ResizeAspectFill:
                playerVc.videoGravity = AVLayerVideoGravityResizeAspectFill
                break
            }
        }
    }
    
    
    func showContent(contentUrl : NSURL){
        playerVc.player = AVPlayer.init(URL: contentUrl)
        playerVc.player?.play()
        playerVc.player?.volume = moviePlayerSoundLevel
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        // 显示播放器的view
        playerVc.showsPlaybackControls = false
        playerVc.view.frame = view.bounds
        view.addSubview(playerVc.view)
        view.bringSubviewToFront(playerVc.view)
    }
    
    func playerItemDidReachEnd() {
        playerVc.player?.seekToTime(kCMTimeZero)
        playerVc.player?.play()
    }

}
