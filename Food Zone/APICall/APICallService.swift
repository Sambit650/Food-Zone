//
//  APICallService.swift
//  Food Zone
//
//  Created by Jovial on 9/7/20.
//  Copyright © 2020 sambit. All rights reserved.
//

import Foundation
import SwiftyJSON

class APICallService {
    
    // MARK:- Login API
    func callAPIGetDetails(params:[String:Any],onSuccess successCallback: ((_ people: APIModel) -> Void)?,
        onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
        // Build URL
        let param:[String:Any] = params
        //print(param)
      let url = "https://appgrowthcompany.com:3000/v1/restaurant/"
        let header = ["Authorization":"SEC eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI1ZTVjYjlmNjczZDA3MjJiOTAyMjRjODAiLCJpYXQiOjE1OTk0NTg1Njl9._oX552c2DakrMOdStMl4yfMawBx1Dp-nZBHAqaCTGXM"]
        
            APICallManager.self.createRequest(
                url, method: .post, headers: header, parameters: param as AnyObject,
                       onSuccess: {(responseObject: JSON) -> Void in
                           // Create dictionary
                           if let responseDict = responseObject.dictionaryObject {
                               // Create object
                               let foodData = APIModel.build(responseDict as [String : AnyObject])
                               // Fire callback
                               successCallback?(foodData)
                           } else {
                               failureCallback?("An error has occured.")
                           }
                       },
                       onFailure: {(errorMessage: String) -> Void in
                           failureCallback?(errorMessage)
                       }
                   )
        
               }
    
    //Get Response and pass data to Controller
    public func callAPIGetDetails(param:[String:Any], onSuccess successCallback: ((_ response: APIModel) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
        self.callAPIGetDetails(
             params: param,onSuccess: { (response) in
                successCallback?(response)
        },
            onFailure: { (errorMessage) in
                failureCallback?(errorMessage)
        }
        )
    }
}

