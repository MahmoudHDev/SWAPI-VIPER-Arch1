//
//  NetworkManager.swift
//  SWAPI-VIPER-Pods
//
//  Created by Mahmoud Hashim on 12/15/22.
//

import Foundation

class NetworkManager {
    
    func getData(completionHandler: @escaping ((Result<People,Error>)-> Void)) {
        guard let url = URL(string: "https://swapi.dev/api/people/?format=json") else {return}
        let dataTask = URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let safeData = data, error == nil else {return}
            
            do {
                
                let decodedData = try JSONDecoder().decode(People.self, from: safeData)
                completionHandler(.success(decodedData))
                print("Success")
            }catch{
                completionHandler(.failure(error))
            }
        }
        dataTask.resume()
    }
}
