//
//  FLTableViewCell.swift
//  Day3-play local video
//
//  Created by 孔凡列 on 16/7/8.
//  Copyright © 2016年 clarence. All rights reserved.
//

import UIKit

class FLTableViewCell: UITableViewCell {

    @IBOutlet weak var iconView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
