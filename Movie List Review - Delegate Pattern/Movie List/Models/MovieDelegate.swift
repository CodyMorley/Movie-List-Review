//
//  MovieDelegate.swift
//  Movie List
//
//  Created by Cody Morley on 8/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

protocol MovieDelegate {
    func addMovie(_ title: String)
    
    func updateMovie(_ movie: Movie)
}
