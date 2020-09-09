//
//  OfferTableViewCell.swift
//  Food Zone
//
//  Created by Jovial on 9/8/20.
//  Copyright © 2020 sambit. All rights reserved.
//

import UIKit

class OfferTableViewCell: UITableViewCell {

    @IBOutlet weak var offerCollectionView:UICollectionView!
    var datamodel3:APIModel?
    
      override func awakeFromNib() {
          super.awakeFromNib()
          offerCollectionView.delegate = self
          offerCollectionView.dataSource = self
      }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension OfferTableViewCell : UICollectionViewDataSource,UICollectionViewDelegate{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
              return 1
          }
          func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            if datamodel3?.mData.mBestOffers.count == 0{
                return 0
            }else{
                return (datamodel3?.mData.mBestOffers.count)!
            }
          }
          
          func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OfferCollectionViewCell", for: indexPath) as! OfferCollectionViewCell
            cell.resturantName.text = datamodel3?.mData.mBestOffers[indexPath.row].mName
            cell.resturantType.text = "\(datamodel3!.mData.mBestOffers[indexPath.row].mDiscountUpto!)% off Valid Up to KES \(datamodel3!.mData.mBestOffers[indexPath.row].mDiscount!)"
            cell.rating.text = "\(datamodel3!.mData.mBestOffers[indexPath.row].mRating!)(\(datamodel3!.mData.mBestOffers[indexPath.row].mRatingCount!))"
            cell.time.text = "\(datamodel3!.mData.mBestOffers[indexPath.row].mAvgDeliveryTime!) Min"
            cell.averageOrderPrice.text = String(datamodel3!.mData.mBestOffers[indexPath.row].mOutletSize!)
            
            return cell
            
          }
}
