//
//  mainTableViewCell.swift
//  Mydaughter
//
//  Created by MyMac on 2017/3/19.
//  Copyright © 2017年 Jack Lai. All rights reserved.
//

import UIKit

class mainTableViewCell: UITableViewCell {

    @IBOutlet weak var mainScrollView: UIScrollView!
    @IBOutlet weak var mainLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
