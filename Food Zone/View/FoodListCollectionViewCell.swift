//
//  FoodListCollectionViewCell.swift
//  Food Zone
//
//  Created by Jovial on 9/7/20.
//  Copyright © 2020 sambit. All rights reserved.
//

import UIKit

class FoodListCollectionViewCell:UICollectionViewCell {
    @IBOutlet weak var foodImage:UIImageView!
    @IBOutlet weak var foodType:UILabel!
    
    override func awakeFromNib() {
        foodImage.layer.cornerRadius = 10
    }
}
