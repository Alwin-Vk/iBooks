//
//  ApiRequestModel.swift
//  iBooks
//
//  Created by ALWIN VARGHESE K on 06/04/2021.
//

import Foundation
import SwiftyJSON
import Alamofire

class ApiRequest : NSObject {
    
    class func requestGET(_ url:URL, success: @escaping (Any) -> Void, failure: @escaping (Error) -> Void){
        AF.request(url, method: .get, encoding: URLEncoding.default)
            .validate()
            .responseJSON { (responseObject) -> Void in
        print(responseObject)
        switch (responseObject.result) {
            case .success( _):
                do {
                    if let resDictionary = responseObject.value {
                        success(resDictionary)
                    }
                    else {
                        
                    }
                }
            case.failure(let error):
                print("Request error: \(error.localizedDescription)")
            }
        }
    }
    
    
}
