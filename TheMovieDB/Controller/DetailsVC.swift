//
//  DetailsVC.swift
//  TheMovieDB
//
//  Created by Vipul Jain on 25/08/21.
//

import UIKit

class DetailsVC: UIViewController {

    var detailtitle: Movie?
    
    
    @IBOutlet weak var detailsImageLabel: UIImageView!
    @IBOutlet weak var detailsTitleView: UILabel!
    @IBOutlet weak var detailsPopularityLabel: UILabel!
    @IBOutlet weak var detailsReleaseLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailsTitleView.text = detailtitle?.title
        detailsPopularityLabel.text = "Popularity Score: " + String(detailtitle?.popularity ?? 0)
        detailsReleaseLabel.text = "Release Year: " + ((detailtitle?.release_date) ?? "")
        let urlImage = URL(string: Constant.base_url.rawValue + ((detailtitle?.backdrop_path) ?? ""))
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: urlImage!)
            DispatchQueue.main.async {
                self.detailsImageLabel.image = UIImage(data: data!)
            }
        }
        
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
