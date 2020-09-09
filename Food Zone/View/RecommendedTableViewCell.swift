//
//  RecommendedTableViewCell.swift
//  Food Zone
//
//  Created by Jovial on 9/8/20.
//  Copyright © 2020 sambit. All rights reserved.
//

import UIKit

class RecommendedTableViewCell: UITableViewCell {

    @IBOutlet weak var recommenedCollectionView:UICollectionView!
    var datamodel4:APIModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        recommenedCollectionView.delegate = self
        recommenedCollectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension RecommendedTableViewCell : UICollectionViewDataSource,UICollectionViewDelegate{
    
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
              return 1
          }
          func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            if datamodel4?.mData.mRecommended.count == 0{
                return 0
            }else{
                return (datamodel4?.mData.mRecommended.count)!
            }
          }
          
          func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommendedCollectionViewCell", for: indexPath) as! RecommendedCollectionViewCell
            cell.resturantName.text = datamodel4?.mData.mRecommended[indexPath.row].mName
            cell.resturantType.text = datamodel4?.mData.mRecommended[indexPath.row].mCategory[0].mName
            cell.rating.text = "\(datamodel4!.mData.mRecommended[indexPath.row].mRating!)(\(datamodel4!.mData.mRecommended[indexPath.row].mRatingCount!))"
            cell.time.text = "\(datamodel4!.mData.mRecommended[indexPath.row].mAvgDeliveryTime!) Min"
            cell.averageOrderPrice.text = String(datamodel4!.mData.mRecommended[indexPath.row].mOutletSize!)
            
            return cell
            
          }
}
