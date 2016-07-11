//
//  FLCollectionViewCell.swift
//  Day5-Carousel Effect
//
//  Created by 孔凡列 on 16/7/9.
//  Copyright © 2016年 clarence. All rights reserved.
//

import UIKit

class FLCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var iconView: UIImageView!
    
    @IBOutlet weak var titileLabel: UILabel!
    
    var model : FLModel!{
        didSet{
            iconView.image = UIImage.init(named: model.imageName!)
            titileLabel.text = model.title
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 5
        self.layer.masksToBounds = true
    }

}
