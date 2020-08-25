//
//  Movie.swift
//  Movie List
//
//  Created by Cody Morley on 8/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

struct Movie: Hashable, Equatable {
    var title: String
    var seen: Bool = false
}
