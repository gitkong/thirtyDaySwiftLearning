//
//  FLTableViewCell.swift
//  Day7-Pull To Refresh and load data
//
//  Created by 孔凡列 on 16/7/13.
//  Copyright © 2016年 clarence. All rights reserved.
//

import UIKit

class FLTableViewCell: UITableViewCell {

    
    @IBOutlet weak var iconView: UIImageView!
    
    var model : FLModel!{
        didSet{
            self.iconView.image = UIImage.init(named: model.name)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
