//
//  MovieDBViewModel.swift
//  TheMovieDB
//
//  Created by Vipul Jain on 31/08/21.
//

import UIKit

class MovieDBViewModel: NSObject {
    var movieList: [Movie]?
    
    func getMovieList(completion: @escaping () -> Void){
        let objNetworking = Networking()
        //activityIndicator.startAnimating()
        objNetworking.response(url: Constant.server_base_url.rawValue) {(movieResult) in
            self.movieList = movieResult.results
            completion()
        }
    }
    func getMovie(for row:Int) -> Movie? {
        guard let movieList = movieList else{
            return nil
        }
        return movieList[row]
    }
    func getTotalMovies() -> Int? {
        guard let movieList = movieList else{
            return nil
        }
        return movieList.count
    }
    
}
