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
        NotificationCenter.default.addObserver(forName: .addMovie,
                                               object: nil,
                                               queue: OperationQueue.main,
                                               using: addToMovies)
        NotificationCenter.default.addObserver(forName: .updateMovie,
                                               object: nil,
                                               queue: OperationQueue.main,
                                               using: updateSeen)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        moviesTable.reloadData()
    }
    
    
    //MARK: - Methods -
    private func addToMovies(_ notification: Notification) {
        guard let title = notification.userInfo?["title"] as? String else { return }
        movieController.createMovie(title)
        moviesTable.reloadData()
    }
    
    private func updateSeen(_ notification: Notification) {
        guard let movie = notification.userInfo?["movie"] as? Movie else { return }
        guard let movieIndex = movieController.movies.firstIndex(of: movie) else { return }
        movieController.movies[movieIndex].seen.toggle()
        moviesTable.reloadData()
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
