//
//  PhotoViewCell.swift
//  ios-instagram-feed
//
//  Created by Yayang Tian on 9/14/15.
//  Copyright © 2015 walmartlabs. All rights reserved.
//

import UIKit

class PhotoViewCell: UITableViewCell {
    
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
