//
//  MoviesViewController.swift
//  Movie List
//
//  Created by Cody Morley on 8/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController {
    //MARK: - Properties -
    @IBOutlet weak var moviesTable: UITableView!
    
    var movieController = MovieController()
    
    //MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        moviesTable.delegate = self
        moviesTable.dataSource = self
    }
    

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
       
    }
    

}


extension MoviesViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movieController.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = moviesTable.dequeueReusableCell(withIdentifier: "MovieCell") as? MovieTableViewCell else { return UITableViewCell()}
        cell.movie = movieController.movies[indexPath.row]
        return cell
    }
}
