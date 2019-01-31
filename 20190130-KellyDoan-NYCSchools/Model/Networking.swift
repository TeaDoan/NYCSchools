//
//  Networking.swift
//  20190130-KellyDoan-NYCSchools
//
//  Created by Thao Doan on 1/30/19.
//  Copyright © 2019 Thao Doan. All rights reserved.
//

import Foundation

class NetWorking {
    
    private static let satEndPointURL = URL(string: "https://data.cityofnewyork.us/resource/734v-jeq5")!
    private static let schoolInfoURL = URL(string:"https://data.cityofnewyork.us/resource/97mf-9njv")!
    
    static func getSchoolSatInfo(completion: @escaping (([School]?) -> Void)) {
        var baseURL = satEndPointURL
        baseURL.appendPathExtension("json")
        var request = URLRequest(url: baseURL)
        request.httpBody = nil
        request.httpMethod = "GET"
        request.addValue("fXvjTY8oTnuuOxO4CRIQkpUhR", forHTTPHeaderField: "X-App-Token")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        URLSession.shared.dataTask(with: request) { data, _, err in
            if let err = err {
                completion(nil)
                print(err.localizedDescription)
                return
            }
            guard let data = data else {
                completion(nil)
                return
            }
            do {
                let schoolData = try JSONDecoder().decode([School].self, from: data)
                completion(schoolData)
                return
            } catch let err {
                print(err.localizedDescription)
                completion(nil)
                return
            }
        }.resume()
    }

}
