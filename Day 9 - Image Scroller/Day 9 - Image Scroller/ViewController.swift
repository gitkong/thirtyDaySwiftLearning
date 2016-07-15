//
//  ViewController.swift
//  Day 9 - Image Scroller
//
//  Created by 孔凡列 on 16/7/14.
//  Copyright © 2016年 clarence. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var scrollImageView = UIImageView()
    
    var scrollView = UIScrollView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        
        scrollImageView.image = UIImage(named: "Steve")
        
        scrollView.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: scrollImageView.image!.size)
        scrollView.delegate = self
        scrollImageView.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: scrollImageView.image!.size)
        scrollView.center = CGPoint(x: view.fl_centerX, y: view.fl_centerY)
        scrollView.addSubview(scrollImageView)
        scrollView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        scrollView.contentSize = CGSize(width: scrollImageView.fl_width, height: scrollImageView.fl_height)
        view.addSubview(scrollView)
        
        setZoomScrollSize(scrollView.bounds.size)
        
        recenterImage()
        
        scrollImageView.userInteractionEnabled = true
        let doubleTapG : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: Selector("doubleTap:"))
        doubleTapG.numberOfTapsRequired = 2
        scrollImageView.addGestureRecognizer(doubleTapG)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        setZoomScrollSize(scrollView.bounds.size)
        
        if scrollView.zoomScale < scrollView.minimumZoomScale {
            scrollView.zoomScale = scrollView.minimumZoomScale
        }
        recenterImage()
    }

    func doubleTap(gestureRecognizer : UITapGestureRecognizer){
//        scrollView.zoomToRect(view.bounds, animated: true)
        setZoomScrollSize(CGSize(width: 2 * scrollImageView.fl_width, height: 2 * scrollImageView.fl_height))
    }
    // 设置最大最小缩放
    private func setZoomScrollSize(scrollSize : CGSize){
        let zoomWidth = scrollSize.width / scrollImageView.fl_width
        let zoomHeigth = scrollSize.height / scrollImageView.fl_height
        let minZoom = min(zoomWidth, zoomHeigth)
        
        scrollView.minimumZoomScale = minZoom
        scrollView.maximumZoomScale = 3.0
    }
    
    // 边界问题
    private func recenterImage() {
        
        let scrollViewSize = scrollView.bounds.size
        let imageViewSize = scrollImageView.frame.size
        let horizontalSpace = imageViewSize.width < scrollViewSize.width ? (scrollViewSize.width - imageViewSize.width) / 2.0 : 0
        let verticalSpace = imageViewSize.height < scrollViewSize.height ? (scrollViewSize.height - imageViewSize.width) / 2.0 :0
        
        scrollView.contentInset = UIEdgeInsetsMake(verticalSpace, horizontalSpace, verticalSpace, horizontalSpace)
        
    }

}

extension ViewController : UIScrollViewDelegate {
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return scrollImageView
    }
    
    func scrollViewDidZoom(scrollView: UIScrollView) {
        recenterImage()
    }
}

