//
//  PhotoCell.swift
//  PhotosApp
//
//  Created by Felicia Weathers on 5/1/16.
//  Copyright © 2016 Felicia Weathers. All rights reserved.
//

import Foundation
import UIKit

class PhotoCell: UICollectionViewCell {
    
    @IBOutlet var placeholderImageView : UIImageView!
    @IBOutlet var titleLabel : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        titleLabel.textColor = UIColor.blackColor()
//        titleLabel.font = UIFont(name: "Avenir", size: 11)
        
        placeholderImageView.layer.borderColor = UIColor(white: 0.2, alpha: 1.0).CGColor
        placeholderImageView.layer.borderWidth = 0.5
    }
}