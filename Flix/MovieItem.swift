//
//  movieItem.swift
//  Flix
//
//  Created by Akshat Goel on 05/09/18.
//  Copyright © 2018 akshat. All rights reserved.
//

import Foundation
import UIKit
import AlamofireImage

class MovieItem: UITableViewCell{
 
    @IBOutlet weak var titleLabel: UILabel!
    
  
    @IBOutlet weak var overviewLabel: UITextView!
   
    @IBOutlet weak var posterImageView: UIImageView!
    
    var movie : Movie! {
        didSet {
            titleLabel.text = movie.title
            overviewLabel.text = movie.overview
            let posterURL = movie.posterURL
            let placeholderImage = UIImage(named: "appicon")!
            let filter = AspectScaledToFillSizeWithRoundedCornersFilter(size: posterImageView.frame.size, radius: 5.0)
            posterImageView.af_setImage(withURL: posterURL!, placeholderImage: placeholderImage, filter: filter, imageTransition: .crossDissolve(0.2))
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
