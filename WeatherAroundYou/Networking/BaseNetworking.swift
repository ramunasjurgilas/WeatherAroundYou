//
//  BaseNetworking.swift
//  WeatherAroundYou
//
//  Created by Ramunas Jurgilas on 2018-05-03.
//  Copyright © 2018 Ramūnas Jurgilas. All rights reserved.
//

import UIKit

class BaseNetworking: NSObject {
    var apiEndPoint: ApiEndPoint?
    
    func execute(completion: @escaping (Data?, Error?) -> Swift.Void) {
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: .current)
        
        let request = urlRequest()
        let task = session.dataTask(with: request) { (data, urlResponse, error) in
            let s = String(data: data ?? Data(), encoding: .utf8)
            print("FROM BACKEND FOR URL: \(self.apiEndPoint?.url().absoluteString ?? "NO URL") JSON from backend : \(s ?? "NO DATA!!!") -> Stats code: \((urlResponse as? HTTPURLResponse)?.statusCode ?? -111111111)" )
            
            session.finishTasksAndInvalidate()
            if
                let data = data,
                let statusCode = (urlResponse as? HTTPURLResponse)?.statusCode, statusCode == 200 && data.count == 0  {
                completion(nil, nil)
                return
            }
            completion(data, error)
        }
        task.resume()
    }

    func execute<T>(_ type: T.Type, completion: @escaping (T?, Error?) -> Swift.Void) where T : Decodable {
        execute { (data, error) in
            guard let data = data else {
                completion(nil, error)
                return
            }
            do {
                let result = try JSONDecoder().decode(type, from: data)
                completion(result, nil)
            } catch let error {
                print("JSON Decoder failed: \(error)")
                completion(nil, error)
            }
        }
    }

    // MARK: - Private methods
    
    private func urlRequest() -> URLRequest {
        let result = URLRequest(url: (apiEndPoint?.url())!)
        
        // Set here http body, http method and other parameters if needed.
        
        return result
    }

}
