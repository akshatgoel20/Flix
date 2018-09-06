//
//  movieItem.swift
//  Flix
//
//  Created by Akshat Goel on 05/09/18.
//  Copyright © 2018 akshat. All rights reserved.
//

import Foundation
import UIKit

class MovieItem: UITableViewCell{
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    
    @IBOutlet weak var overviewTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
