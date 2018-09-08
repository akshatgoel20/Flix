//
//  DetailMovieViewController.swift
//  Flix
//
//  Created by Akshat Goel on 06/09/18.
//  Copyright © 2018 akshat. All rights reserved.
//

import UIKit



class DetailMovieViewController: UIViewController {
    
    enum MovieKeys {
        static let title  = "title"
        static let releaseDate = "release_date"
        static let overview = "overview"
        static let backdropString  = "backdrop_path"
        static let posterPathString  = "poster_path"
    }
    
    var movie: [String: Any]?
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var coverImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let movie  = movie{
            movieName.text = movie[MovieKeys.title] as? String
            overviewLabel.text = movie[MovieKeys.overview] as? String
            releaseDate.text = movie[MovieKeys.releaseDate] as? String
            let backdropPathString  = movie[MovieKeys.backdropString] as? String
            let posterPathString = movie[MovieKeys.posterPathString] as? String
            
            let baseURLString = "https://image.tmdb.org/t/p/w500"
            let backdropURL = URL(string: baseURLString+backdropPathString!
            )
            
            coverImageView.af_setImage(withURL: backdropURL!)
            let posterPathURL = URL(string: baseURLString+posterPathString!)
            profileImageView.af_setImage(withURL: posterPathURL!)
            
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
