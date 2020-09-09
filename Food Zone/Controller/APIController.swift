//
//  APIController.swift
//  Food Zone
//
//  Created by Jovial on 9/7/20.
//  Copyright © 2020 sambit. All rights reserved.
//

import Foundation

protocol ResturantViewProtocol: NSObjectProtocol {
    func setDetail(data: APIModel)
    func showErrorMessage(data: APIModel)
}

class APIController {
    private let apiCallService:APICallService
    weak private var restaurantView : ResturantViewProtocol?
    
    init(apiCallService:APICallService) {
        self.apiCallService = apiCallService
    }
    
    func attachView(view:ResturantViewProtocol) {
        restaurantView = view
    }
    
    func detachView() {
        restaurantView = nil
    }
    
    func getDetails(params : [String:Any]) {
        let param = params
        apiCallService.callAPIGetDetails(param: param, onSuccess: { (details) in
            //status = true || false
            if details.mResponse.mSuccess == true{
                self.restaurantView?.setDetail(data: details)
            
            }else{
                self.restaurantView?.showErrorMessage(data: details)
                
            }

        }, onFailure: { (errorMessage) in
            print("error")
        })
    }
   
}
