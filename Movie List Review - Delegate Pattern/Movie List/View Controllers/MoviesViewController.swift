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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        moviesTable.reloadData()
    }
    

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "AddMovie":
            guard let AddVC = segue.destination as? AddMovieViewController else { return }
            AddVC.delegate = self
        default:
            NSLog("Unknown Segue")
            break
        }
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
        cell.delegate = self
        return cell
    }
}

extension MoviesViewController: MovieDelegate {
    func updateMovie(_ movie: Movie) {
        guard let movieIndex = movieController.movies.firstIndex(of: movie) else { return }
        movieController.movies[movieIndex].seen.toggle()
        moviesTable.reloadData()
    }
    
    func addMovie(_ title: String) {
        movieController.createMovie(title)
        moviesTable.reloadData()
    }
}
