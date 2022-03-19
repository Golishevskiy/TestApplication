//
//  Network.swift
//  TestApplication
//
//  Created by Petro Golishevskiy on 19.03.2022.
//

import Foundation

class Network {
    static var shared = Network()
    
    func getPosts(completion: @escaping ([Post]) -> Void) {
        let session = URLSession(configuration: .default)
        guard let url = URL(string: "https://raw.githubusercontent.com/aShaforostov/jsons/master/api/main.json") else { return }
        
        session.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                print("DataTask error: \(error.localizedDescription)")
            } else if
                let data = data,
                let response = response as? HTTPURLResponse,
                response.statusCode == 200 {
                let response = try? JSONDecoder().decode(NewsModel.self, from: data)
                guard let posts = response?.posts else { return }
                DispatchQueue.main.async {
                    completion(posts)
                }
            }
        }.resume()
    }
}

