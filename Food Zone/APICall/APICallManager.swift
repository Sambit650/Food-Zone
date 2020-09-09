//
//  APICallManager.swift
//  Food Zone
//
//  Created by Jovial on 9/7/20.
//  Copyright © 2020 sambit. All rights reserved.
//

import Alamofire
import SwiftyJSON
import Foundation
import UIKit

class APICallManager {

    static let instance = APICallManager()

    // Create request
       class func createRequest(
         _ url: String,
         method: HTTPMethod,
         headers: [String: String]?,
         parameters: AnyObject?,
         onSuccess successCallback: ((JSON) -> Void)?,
         onFailure failureCallback: ((String) -> Void)?
         ) {
         
         //Call API with ALamofire
         Alamofire.request(url, method: method, parameters: parameters as? Parameters, encoding: JSONEncoding.default, headers:  headers).validate().responseJSON { response in
                 switch response.result {
                 case .success(let value):
                     let json = JSON(value)
                    //print("json :\(json)")
                     successCallback?(json)
                 case .failure(let error):
                     if let callback = failureCallback {
                     // Return
                     callback(error.localizedDescription)
                 }
             }
         }
     }

}
