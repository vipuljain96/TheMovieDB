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
   
 
//    struct Movies{
//        
//        //Defining Variables
//        var movieName: String?
//        var image: String?
//        var releaseYear: Int?
//        var popScore: Double?
//    }
    
    var movieList:[Movie]?
    var vm = MovieDBViewModel()
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
  
    @IBOutlet weak var objTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        vm.getMovieList {
            DispatchQueue.main.async {
                self.objTableView.reloadData()
                self.activityIndicator.stopAnimating()
            }
        }
        
        //movieList = []
        
//        let objNetworking = Networking()
//        
//        activityIndicator.startAnimating()
//        objNetworking.response(url: Constant.server_base_url.rawValue) {(movieResult) in
//            self.movieList = movieResult.results
//            DispatchQueue.main.async {
//                self.objTableView.reloadData()
//                self.activityIndicator.stopAnimating()
//            }
//        }
        
    }
    
    // creating object as a array of structure: Movies
    //var objMovies = [Movies]()
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.getTotalMovies() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

//        //MARK: Database Creation
//
//        let movieName = ["Jagga Jasoos" , "Luca", "Gateway", "Aladdin"]
//        let image = ["JaggaJasoos.png", "Luca.png", "Gateway.png", "Aladdin.png"]
//        let releaseYear = [2017, 2018, 2018, 2014]
//        let popScore = [100.21, 23.2, 1212.1, 123.12]
//
//        //Inserting each Entry To the Object of Movies Structure
//        for i in 0..<4
//        {
//            objMovies.append(Movies(movieName:movieName[i], image:image[i], releaseYear: releaseYear[i], popScore: popScore[i]))
//        }
        
        //Creating a cell to modify the entries within it
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as? CustomCell
        
        cell?.titleLabel.text = vm.getMovie(for: indexPath.row)?.title ?? ""
        
//        cell?.titleLabel.text = movieList?[indexPath.row].title ?? ""
//
        let urlImage = URL(string: Constant.base_url.rawValue + ((vm.getMovie(for: indexPath.row)?.backdrop_path) ?? ""))

        DispatchQueue.global().async {
            let data = try? Data(contentsOf: urlImage!)
            DispatchQueue.main.async {
                cell?.movieImageLabel.image = UIImage(data: data!)
            }
        }

        //cell?.movieImageLabel.image = UIImage(named: movieList[indexPath.row].image!)
        cell?.popularityLabel.text = "Popularity Score: " + String((vm.getMovie(for: indexPath.row)?.popularity ?? 0))
        cell?.releaseYearLabel.text = "Release Year: " + String((vm.getMovie(for: indexPath.row)?.release_date ?? ""))
        
        return cell!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 190.0
    }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        var objSelectedMovie =  movieList?[indexPath.row]
//
//        let objDetailsVC: DetailsVC =  self.storyboard?.instantiateViewController(identifier: "DetailsVC") as! DetailsVC
//
//        objDetailsVC.detailtitle = objSelectedMovie
//        navigationController?.pushViewController(objDetailsVC, animated: true)
//    }
//        if let objDetailsVC = objDetailsVC{
//            objDetailsVC.detailsTitleView.text = objSelectedMovie?.title
//            objDetailsVC.detailsPopularityLabel.text = String(objSelectedMovie?.popularity ?? 0)
//            objDetailsVC.detailsReleaseLabel.text = objSelectedMovie?.release_date
//            let urlImage = URL(string: Extension.base_url.rawValue + ((objSelectedMovie?.backdrop_path) ?? ""))
//            DispatchQueue.global().async {
//                let data = try? Data(contentsOf: urlImage!)
//                DispatchQueue.main.async {
//                    objDetailsVC.detailsImageLabel.image = UIImage(data: data!)
//                }
//            }

        

}

// Do any additional setup after lading the view


