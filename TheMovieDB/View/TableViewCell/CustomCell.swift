//
//  CustomCell.swift
//  TheMovieDB
//
//  Created by Vipul Jain on 25/08/21.
//

import UIKit

class CustomCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //MARK : IBOutlet for Editing Cell Contents
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var popularityLabel: UILabel!
    @IBOutlet weak var movieImageLabel: UIImageView!
    @IBOutlet weak var releaseYearLabel: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
