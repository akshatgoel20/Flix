//
//  PosterCell.swift
//  Flix
//
//  Created by Akshat Goel on 12/09/18.
//  Copyright © 2018 akshat. All rights reserved.
//

import UIKit
import AlamofireImage

class PosterCell: UICollectionViewCell {
    
   
    @IBOutlet weak var posterImagevView: UIImageView!
    var movies : Movie! {
        didSet {
            let posterURL = movies.posterURL
            let placeholderImage = UIImage(named: "placeholder")!
            posterImagevView.af_setImage(withURL: posterURL!, placeholderImage: placeholderImage)
        }
    }
    
}


