//
//  SavedRTableViewCell.swift
//  Food Zone
//
//  Created by Jovial on 9/7/20.
//  Copyright © 2020 sambit. All rights reserved.
//

import UIKit

class SavedRTableViewCell: UITableViewCell {

    @IBOutlet weak var headerName: UILabel!
    @IBOutlet weak var resturantCollectionView:UICollectionView!
    
    var datamodel2:APIModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        resturantCollectionView.delegate = self
        resturantCollectionView.dataSource = self
        headerName.text = "Saved restaurants"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension SavedRTableViewCell : UICollectionViewDataSource,UICollectionViewDelegate{
    
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
              return 1
          }
          func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            if datamodel2?.mData.mSaved.count == 0{
                return 0
            }else{
                return (datamodel2?.mData.mSaved.count)!
            }
          }
          
          func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ResturentListCollectionViewCell", for: indexPath) as! ResturentListCollectionViewCell
            cell.resturantName.text = datamodel2?.mData.mSaved[indexPath.row].mName
            cell.resturantType.text = datamodel2?.mData.mSaved[indexPath.row].mCategory[0].mName
            cell.rating.text = "\(datamodel2!.mData.mSaved[indexPath.row].mRating!)(\(datamodel2!.mData.mSaved[indexPath.row].mRatingCount!))"
            cell.time.text = "\(datamodel2!.mData.mSaved[indexPath.row].mAvgDeliveryTime!) Min"
            cell.averageOrderPrice.text = String(datamodel2!.mData.mSaved[indexPath.row].mOutletSize!)
            
            return cell
            
          }
}
