//
//  ViewController.swift
//  Day4-Snapchat Menu & Camera
//
//  Created by 孔凡列 on 16/7/8.
//  Copyright © 2016年 clarence. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController ,UIScrollViewDelegate ,UIImagePickerControllerDelegate,UINavigationControllerDelegate,AVCaptureMetadataOutputObjectsDelegate{
    
    let f = CGFloat(arc4random_uniform(256)) / 255.0
    
    let windowW = UIScreen.mainScreen().bounds.size.width
    
    let windowH = UIScreen.mainScreen().bounds.size.height
    
    var scrollView : UIScrollView?
    
    var firstVc : UIImagePickerController?
    
    var secondVc : UITableViewController?
    
    var thirdVc : UIViewController?
    
    lazy var dataArr : NSArray = {
        return["first","second","third"]
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
//        print(f)
        scrollView = UIScrollView.init(frame: self.view.bounds)
        
        
        scrollView?.contentSize = CGSize.init(width: CGFloat(dataArr.count) * windowW, height: windowH)
        
        scrollView?.pagingEnabled = true
        
        scrollView?.delegate = self
        
        self.view.addSubview(scrollView!)
        
        self.addViewController()
        
        self.scrollViewDidEndDecelerating(scrollView!)
        
    }
    
    func addViewController() {
        firstVc = UIImagePickerController.init()
        firstVc?.delegate = self
        firstVc?.sourceType = UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) ? UIImagePickerControllerSourceType.Camera : UIImagePickerControllerSourceType.SavedPhotosAlbum
        firstVc?.allowsEditing = true
        firstVc?.view.backgroundColor = UIColor.blueColor()
        self.addChildViewController(firstVc!)
        
        secondVc = UITableViewController.init(style: UITableViewStyle.Plain)
        secondVc?.view.backgroundColor = UIColor.greenColor()
        self.addChildViewController(secondVc!)
        
        thirdVc = UIViewController.init()
        thirdVc?.view.backgroundColor = UIColor.yellowColor()
        self.addChildViewController(thirdVc!)
    }

    func scrollViewDidScroll(scrollView: UIScrollView) {
        
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let index = scrollView.contentOffset.x / scrollView.frame.size.width
        let vc = self.childViewControllers[Int(index)]
        vc.view.frame = scrollView.bounds
        scrollView.addSubview(vc.view)
        print(index)
    }
    


}

