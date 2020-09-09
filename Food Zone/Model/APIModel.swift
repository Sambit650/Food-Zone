//
//  APIModel.swift
//  Food Zone
//
//  Created by Jovial on 9/7/20.
//  Copyright © 2020 sambit. All rights reserved.
//

import Foundation

class APIModel{
    var mResponse = ResponseModel()
    var mData = DataModel()
    
    //MARK:- Instance Method
             func loadFromDictionary(_ dict: [String: AnyObject]) {
                 
             if let data = dict["response"] as? [String:AnyObject] {
                  let model = ResponseModel.build(data)
                  self.mResponse = model
              }
            if let data = dict["data"] as? [String:AnyObject] {
                let model = DataModel.build(data)
                self.mData = model
            }
         }
         // MARK: Class Method
         class func build(_ dict: [String: AnyObject]) -> APIModel{
             let responseDict = APIModel()
             responseDict.loadFromDictionary(dict)
             return responseDict
         }
}
class ResponseModel{
    var mSuccess : Bool?
    var mMessage : String = ""
       
       //MARK:- Instance Method
           func loadFromDictionary(_ dict: [String: AnyObject]) {
               
            if let data = dict["success"] as? Bool {
               self.mSuccess = data
            }
           if let data = dict["message"] as? String {
              self.mMessage = data
           }
       }
       // MARK: Class Method
       class func build(_ dict: [String: AnyObject]) -> ResponseModel{
           let responseDict = ResponseModel()
           responseDict.loadFromDictionary(dict)
           return responseDict
       }
}

class DataModel{
    var mCategory = [CategoryModel]()
    var mSaved = [SavedModel]()
    var mBestOffers = [BestOfferModel]()
    var mRecommended = [SavedModel]()
    
    func loadFromDictionary(_ dict: [String: AnyObject]) {
    
        if let data = dict["categories"] as? Array<Dictionary<String,AnyObject>> {
            for dict in data {
                let modelData = CategoryModel.build(dict)
                mCategory.append(modelData)
            }
          }
        if let data = dict["saved"] as? Array<Dictionary<String,AnyObject>> {
          for dict in data {
              let modelData = SavedModel.build(dict)
              mSaved.append(modelData)
          }
        }
        if let data = dict["bestOffers"] as? Array<Dictionary<String,AnyObject>> {
          for dict in data {
              let modelData = BestOfferModel.build(dict)
              mBestOffers.append(modelData)
          }
        }
        if let data = dict["recommended"] as? Array<Dictionary<String,AnyObject>> {
          for dict in data {
              let modelData = SavedModel.build(dict)
              mRecommended.append(modelData)
          }
        }
    
    }
    
    // MARK: Class Method
    class func build(_ dict: [String: AnyObject]) -> DataModel{
        let responseDict = DataModel()
        responseDict.loadFromDictionary(dict)
        return responseDict
    }
}

class CategoryModel{
    var mId : String = ""
    var mName : String = ""
    var mImage : String = ""
    var mRestrant : Int?
    
    //MARK:- Instance Method
             func loadFromDictionary(_ dict: [String: AnyObject]) {
                 
              if let data = dict["_id"] as? String {
                 self.mId = data
              }
              if let data = dict["name"] as? String {
                self.mName = data
              }
              if let data = dict["image"] as? String {
                 self.mImage = data
               }
               if let data = dict["restaurants"] as? Int {
                  self.mRestrant = data
                }
         }
         // MARK: Class Method
         class func build(_ dict: [String: AnyObject]) -> CategoryModel{
             let responseDict = CategoryModel()
             responseDict.loadFromDictionary(dict)
             return responseDict
         }
}

class SavedModel{
    var mId : String = ""
    var mName : String = ""
    var mRating : Double?
    var mRatingCount : Int?
    var mAvgDeliveryTime : Int?
    var mImage : String = ""
    var mOutletSize : Int?
    var mCategory = [FoodCategory]()
    
    //MARK:- Instance Method
        func loadFromDictionary(_ dict: [String: AnyObject]) {
            
         if let data = dict["_id"] as? String {
            self.mId = data
         }
         if let data = dict["name"] as? String {
           self.mName = data
         }
         if let data = dict["image"] as? String {
            self.mImage = data
          }
          if let data = dict["ratings"] as? Double {
             self.mRating = data
           }
          if let data = dict["ratingCount"] as? Int {
           self.mRatingCount = data
          }
            if let data = dict["outletSize"] as? Int {
              self.mOutletSize = data
            }
            if let data = dict["avgDeliveryTime"] as? Int {
              self.mAvgDeliveryTime = data
            }
            if let data = dict["categories"] as? Array<Dictionary<String,AnyObject>> {
              for dict in data {
                  let modelData = FoodCategory.build(dict)
                  mCategory.append(modelData)
              }
            }
    }
    // MARK: Class Method
    class func build(_ dict: [String: AnyObject]) -> SavedModel{
        let responseDict = SavedModel()
        responseDict.loadFromDictionary(dict)
        return responseDict
    }
}
class FoodCategory{
    var mName : String = ""
    
    func loadFromDictionary(_ dict: [String: AnyObject]) {
    
        if let data = dict["name"] as? String {
          self.mName = data
        }
    }
        // MARK: Class Method
        class func build(_ dict: [String: AnyObject]) -> FoodCategory{
            let responseDict = FoodCategory()
            responseDict.loadFromDictionary(dict)
            return responseDict
        }
}

class BestOfferModel{
    var mId:String = ""
    var mImage:String = ""
    var mName:String = ""
    var mDiscount:Int?
    var mDiscountUpto:Int?
    var mRating:Double?
    var mRatingCount:Int?
    var mAvgDeliveryTime:Int?
    var mOutletSize:Int?
    
    //MARK:- Instance Method
           func loadFromDictionary(_ dict: [String: AnyObject]) {
               
            if let data = dict["_id"] as? String {
               self.mId = data
            }
            if let data = dict["image"] as? String {
               self.mImage = data
            }
            if let data = dict["name"] as? String {
               self.mName = data
            }
            if let data = dict["discount"] as? Int {
               self.mDiscount = data
            }
            if let data = dict["discountUpto"] as? Int {
               self.mDiscountUpto = data
            }
            if let data = dict["ratings"] as? Double {
               self.mRating = data
            }
            if let data = dict["ratingCount"] as? Int {
               self.mRatingCount = data
            }
            if let data = dict["avgDeliveryTime"] as? Int {
               self.mAvgDeliveryTime = data
            }
            if let data = dict["outletSize"] as? Int {
               self.mOutletSize = data
            }
    }
    // MARK: Class Method
         class func build(_ dict: [String: AnyObject]) -> BestOfferModel{
             let responseDict = BestOfferModel()
             responseDict.loadFromDictionary(dict)
             return responseDict
         }
}

