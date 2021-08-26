//
//  Networking.swift
//  TheMovieDB
//
//  Created by Vipul Jain on 25/08/21.
//

import Foundation
class Networking {
    func response(url : String , completion : @escaping (MovieResult) -> ()){
        
        guard let url = URL(string: url) else {return}
        
        let objUrlSession = URLSession.shared
        
        objUrlSession.dataTask(with: url,completionHandler: { (data, response, error) in
            
            guard let data = data else {return}
            
            do{
                let jsondecoder = JSONDecoder()
                let movies = try jsondecoder.decode(MovieResult.self, from: data)
                completion(movies)
            } catch{
                print("Error \(error)")
            }
            
        }).resume()
    }
    
}
