//
//  AFNHelper.swift
//  ZBJumpSwift
//
//  Created by jumpapp1 on 2019/1/21.
//  Copyright © 2019年 zb. All rights reserved.
//

import UIKit
import AFNetworking


// requet type
enum HTTPMethod {
    case GET
    case POST
}


class AFNHelper: AFHTTPSessionManager {
    
    static let shareInstance: AFNHelper = {
        let manager = AFNHelper()
        manager.requestSerializer = AFJSONRequestSerializer()
        
        let setArr = NSSet(objects: "text/html", "application/json", "text/json")
        manager.responseSerializer.acceptableContentTypes = setArr as? Set<String>
        
        // add HttpHeader
        manager.requestSerializer.setValue("application/json", forHTTPHeaderField: "Content-Type")
        manager.requestSerializer.setValue("application/json", forHTTPHeaderField: "Accept")
        
        manager.requestSerializer.willChangeValue(forKey: "timeoutInterval")
        manager.requestSerializer.timeoutInterval = 30.0
        manager.requestSerializer.didChangeValue(forKey: "timeoutInterval")
        return manager
    }()
    
    /**
     A method of opening to the outside world is defined to make requests for network data.
     
     - parameter methodType:        request type(GET / POST)
     - parameter urlString:         url address
     - parameter parameters:
     The parameter required to send a network                  request is a dictionary.
     
     - parameter resultBlock:       The completed callback.
     
     - parameter responseObject:    Callback parameters to return the requested   data.
     
     - parameter error:             If the request succeeds, then the error is nil.
     
     */
    
    func request(methodType: HTTPMethod, urlString: String, parameters: [String : AnyObject]?, resultBlock:@escaping (Any?, Error?)->()) {
        
        // If the request succeeds, then the error is nil.
        let successBlock = { (task: URLSessionDataTask, responseObj: Any?) in
            resultBlock(responseObj, nil)
        }
        
        // If the request succeeds, then the error is nil.
        let failureBlock = { (task: URLSessionDataTask?, error: Error) in
            resultBlock(nil, error)
        }
        
        // request type
        if methodType == HTTPMethod.GET {
            
            get(urlString, parameters: parameters, progress: nil, success: successBlock, failure: failureBlock)
        } else {
            post(urlString, parameters: parameters, progress: nil, success: successBlock, failure: failureBlock)
        }
    }
}



//* GET请求
//AFNHelper.shareInstance.request(methodType: .GET, urlString: apiURL, parameters: dic) { (result, error) in
//
//    }
//    * POST请求
//AFNHelper.shareInstance.request(methodType: .POST, urlString: apiURL, parameters: dic) { (result, error) in
//
//    }


