//
//  ViewController.swift
//  Day5-Carousel Effect
//
//  Created by 孔凡列 on 16/7/8.
//  Copyright © 2016年 clarence. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let windowW : CGFloat = UIScreen.mainScreen().bounds.size.width
    
    let windowH : CGFloat = UIScreen.mainScreen().bounds.size.height
    
    lazy var effectView : UIVisualEffectView  = {
        let effect = UIBlurEffect.init(style: UIBlurEffectStyle.Light)
        let effectV = UIVisualEffectView.init(effect: effect)
        effectV.frame = CGRect.init(x: 0, y: 0, width: UIScreen.mainScreen().bounds.size.width , height: UIScreen.mainScreen().bounds.size.height)
        effectV.backgroundColor = UIColor.clearColor()
        return effectV
    }()
    
    var backgroundImageView : UIImageView?
    
    var collectionView : UICollectionView?
    
    var layout : UICollectionViewFlowLayout?
    
    private var modelArr  = FLModel.creatModelArr()

    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundImageView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: windowW, height: windowH))
        backgroundImageView?.image = UIImage.init(named: "blue")
        backgroundImageView?.addSubview(effectView)
        self.view.addSubview(backgroundImageView!)
        
        self.view.backgroundColor = UIColor.whiteColor()
        layout = UICollectionViewFlowLayout.init()
        
        layout?.minimumLineSpacing = 10.0
        layout?.minimumInteritemSpacing = 0.0
        layout?.itemSize = CGSize.init(width: 300, height: 400)
        layout?.scrollDirection = .Horizontal
        
        
        collectionView = UICollectionView.init(frame: CGRect.init(x: 0, y: (windowH - 400) / 2, width:  windowW, height: 400), collectionViewLayout: layout!
        )
        collectionView?.contentInset = UIEdgeInsetsMake(0, 10, 0, 10)
        collectionView?.backgroundColor = UIColor.clearColor()
        collectionView?.contentSize = CGSize.init(width: 300, height: 400)
        collectionView?.dataSource = self;
        collectionView?.delegate = self;
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.registerNib(UINib.init(nibName: "FLCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        self.view.addSubview(collectionView!)
        
        
        
        
    }

}

extension ViewController : UICollectionViewDelegate,UICollectionViewDataSource{
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return modelArr.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! FLCollectionViewCell
        cell.model = modelArr[indexPath.item]
        return cell
    }
}

