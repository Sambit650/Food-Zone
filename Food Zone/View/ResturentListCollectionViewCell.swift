//
//  ResturentListCollectionViewCell.swift
//  Food Zone
//
//  Created by Jovial on 9/7/20.
//  Copyright © 2020 sambit. All rights reserved.
//

import UIKit

class ResturentListCollectionViewCell:UICollectionViewCell {
    
    @IBOutlet weak var foodImage:UIImageView!
    @IBOutlet weak var resturantName:UILabel!
    @IBOutlet weak var resturantType:UILabel!
    @IBOutlet weak var rating:UILabel!
    @IBOutlet weak var time:UILabel!
    @IBOutlet weak var averageOrderPrice:UILabel!
    
    override func awakeFromNib() {
        foodImage.layer.cornerRadius = 10
    }
    
}
