//
//  NetworkManager.swift
//  BackbaseDemo
//
//  Created by Sagar Chavan on 25/02/22.
//


import Foundation

class NetworkManager: NSObject {
    
    func getDataFrom(completion: @escaping ([Cities]?, Error?) -> Void) {
        let url = Bundle.main.url(forResource: "cities", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        do {
            let jsonDescription = try JSONDecoder().decode([Cities].self, from: data)
            completion(jsonDescription,nil)
        }
        catch let jsonError {
            print("Json Error:", jsonError)
        }
    }
}

