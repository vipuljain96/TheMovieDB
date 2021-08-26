//
//  MovieModel.swift
//  TheMovieDB
//
//  Created by Vipul Jain on 25/08/21.
//

import UIKit

//MARK: Structutre Definition
struct Movies{
    
    //Defining Variables
    var movieName: String?
    var image: String?
    var releaseYear: Int?
    var popScore: Double?
}

struct MovieResult : Codable{
    var results: [Movie]?
}

struct Movie : Codable{
    var title: String?
    var popularity: Double?
    var release_date: String?
    var backdrop_path: String?
}
