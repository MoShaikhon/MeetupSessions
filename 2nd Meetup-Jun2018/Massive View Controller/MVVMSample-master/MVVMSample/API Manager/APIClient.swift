//
//  APIClient.swift
//  SixtCars
//
//  Created by Hesham on 6/18/18.
//  Copyright © 2018 Hesham. All rights reserved.
//

import Alamofire

class APIClient {
    
    @discardableResult
    private static func performRequest<T:Decodable>(route:APIRouter, decoder: JSONDecoder = JSONDecoder(), completion:@escaping (Result<T>)->Void) -> DataRequest {
        return Alamofire.request(route).responseJSONDecodable (decoder: decoder) { (response: DataResponse<T>) in
            completion(response.result)
        }
    }
    
    static func getProperties(completion: @escaping (Result<Properties>) -> Void) {
        performRequest(route: APIRouter.getProperties, completion: completion)
    }
}
