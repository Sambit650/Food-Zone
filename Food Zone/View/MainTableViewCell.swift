//
//  MainTableViewCell.swift
//  Food Zone
//
//  Created by Jovial on 9/7/20.
//  Copyright © 2020 sambit. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    @IBOutlet weak var foodListCollectionView:UICollectionView!
    var datamodel:APIModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        foodListCollectionView.delegate = self
        foodListCollectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension MainTableViewCell: UICollectionViewDelegate,UICollectionViewDataSource{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if datamodel?.mData.mCategory.count == 0{
           return 0
       }else{
            return (datamodel?.mData.mCategory.count)!
       }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cCell = collectionView.dequeueReusableCell(withReuseIdentifier: "FoodListCollectionViewCell", for: indexPath) as! FoodListCollectionViewCell
        cCell.foodType.text = "\(datamodel!.mData.mCategory[indexPath.row].mName)(\(datamodel!.mData.mCategory[indexPath.row].mRestrant!))"
        
        return cCell
    }
    
    
}
