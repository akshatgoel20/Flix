//
//  ViewController.swift
//  Flix
//
//  Created by Akshat Goel on 05/09/18.
//  Copyright © 2018 akshat. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import MBProgressHUD

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
   

    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var movies: [Movie] = []
    var allMovies: [Movie] = []
    var refreshControl: UIRefreshControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(ViewController.didPullToRefresh(_:)), for: .valueChanged)
        tableView.insertSubview(refreshControl, at: 0 )
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 150
        
        searchBar.delegate = self
        fetchMovies()
        
    }
    
    @objc func didPullToRefresh(_ refreshControl: UIRefreshControl){
        fetchMovies()
    }
    
    func fetchMovies() {
        MBProgressHUD.showAdded(to: self.view, animated: true)
        
        MovieApiManager().nowPlayingMovies { (movies: [Movie]?, error: Error?) in
            if let movies = movies {
                self.movies = movies
                self.allMovies = self.movies
                self.tableView.reloadData()
                self.refreshControl.endRefreshing()
                MBProgressHUD.hide(for: self.view, animated: true)
            } else {
                print(error!.localizedDescription)
                MBProgressHUD.hide(for: self.view, animated: true)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieItem", for: indexPath) as! MovieItem
        cell.movie = movies[indexPath.row]
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.clear
        cell.selectedBackgroundView = backgroundView
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPath(for: cell)
        let detailViewControler = segue.destination as! DetailMovieViewController
        detailViewControler.movie = movies[(indexPath?.row)!]
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        movies = (searchText.isEmpty) ? allMovies : allMovies.filter { (item: Movie) -> Bool in
            let i = item.title
            return i.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
        }
        tableView.reloadData()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.searchBar.showsCancelButton = true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        searchBar.text = ""
        movies = self.allMovies
        tableView.reloadData()
        searchBar.resignFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

