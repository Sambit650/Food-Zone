//
//  ResturantViewController.swift
//  Food Zone
//
//  Created by Jovial on 9/7/20.
//  Copyright © 2020 sambit. All rights reserved.
//

import UIKit


class ResturantViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var mainTableView:UITableView! 
    
    var apiController = APIController(apiCallService: APICallService())
    var apiData = APIModel()
    var newUser:Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mainTableView.delegate = self
        mainTableView.dataSource = self
        apiController.attachView(view: self)
        let parameters = ["longitude": 76.4546, "latitude": 30.1236] as [String : Any]
        apiController.getDetails(params: parameters)
        
         //checking user one first time or not
         newUser = UserDefaults.standard.bool(forKey: "isNewUser")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if newUser == false{
            return 3
        }else{
            return 4
        }
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let rCell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: indexPath) as! MainTableViewCell
            rCell.datamodel = apiData
            rCell.foodListCollectionView.reloadData()
            return rCell
        }else if indexPath.row == 1{
            let sCell = tableView.dequeueReusableCell(withIdentifier: "SavedRTableViewCell", for: indexPath) as! SavedRTableViewCell
            sCell.datamodel2 = apiData
            sCell.resturantCollectionView.reloadData()
            return sCell
        }else if indexPath.row == 2{
          let oCell = tableView.dequeueReusableCell(withIdentifier: "OfferTableViewCell", for: indexPath) as! OfferTableViewCell
           oCell.datamodel3 = apiData
            oCell.offerCollectionView.reloadData()
           return oCell
        }else{
            let rCell = tableView.dequeueReusableCell(withIdentifier: "RecommendedTableViewCell", for: indexPath) as! RecommendedTableViewCell
            rCell.datamodel4 = apiData
            rCell.recommenedCollectionView.reloadData()
            return rCell
        }
       }
}

extension ResturantViewController:ResturantViewProtocol{
    func setDetail(data: APIModel) {
        print("success")
        apiData = data
        
        //set true value in userdefault for recommended
        UserDefaults.standard.set(true, forKey: "isNewUser")
        mainTableView.reloadData()
    }
    
    func showErrorMessage(data: APIModel) {
        print("error")
    }
}
