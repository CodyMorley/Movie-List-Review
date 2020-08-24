//
//  MovieController.swift
//  Movie List
//
//  Created by Cody Morley on 8/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

class MovieController {
    
    var movies = [Movie]()
    
    func createMovie(_ title: String) {
        var newMovie = Movie(title: title, seen: false)
        movies.append(newMovie)
    }
}
