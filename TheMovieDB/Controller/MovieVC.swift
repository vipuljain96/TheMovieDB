//
//  MovieVC.swift
//  TheMovieDB
//
//  Created by Vipul Jain on 25/08/21.
//

import UIKit

//MARK: Movies View Controller
///
class MovieVC: UIViewController, UITableViewDataSource,UITableViewDelegate {
   
    //MARK: Structutre Definition
    struct Movies{
        
        //Defining Variables
        var movieName: String?
        var image: String?
        var releaseYear: Int?
        var popScore: Double?
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // creating object as a array of structure: Movies
    var objMovies = [Movies]()
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        //MARK: Database Creation
    
        let movieName = ["Jagga Jasoos" , "Luca", "Gateway", "Aladdin"]
        let image = ["JaggaJasoos.png", "Luca.png", "Gateway.png", "Aladdin.png"]
        let releaseYear = [2017, 2018, 2018, 2014]
        let popScore = [100.21, 23.2, 1212.1, 123.12]
        
        //Inserting each Entry To the Object of Movies Structure
        for i in 0..<4
        {
            objMovies.append(Movies(movieName:movieName[i], image:image[i], releaseYear: releaseYear[i], popScore: popScore[i]))
        }
        
        //Creating a cell to modify the entries within it
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as? CustomCell
        cell?.titleLabel.text = "Title: " + objMovies[indexPath.row].movieName!
        cell?.movieImageLabel.image = UIImage(named: objMovies[indexPath.row].image!)
        cell?.popularityLabel.text = "Popularity Score: " + String(objMovies[indexPath.row].popScore!)
        cell?.releaseYearLabel.text = "Release Year: " + String(objMovies[indexPath.row].releaseYear!)
        
        return cell!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 190.0
    }

        // Do any additional setup after loading the view.
}

