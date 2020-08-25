//
//  MovieTableViewCell.swift
//  Movie List
//
//  Created by Cody Morley on 8/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var seenButton: UIButton!
    
    var movie: Movie? {
        didSet {
            updateViews()
        }
    }
    
    @IBAction func seenTapped(_ sender: Any) {
        guard let movie = movie else { return }
        NotificationCenter.default.post(name: .updateMovie,
                                        object: nil,
                                        userInfo: ["movie" : movie])
        updateViews()
    }
    
    func updateViews() {
        guard let movie = movie else { return }
        titleLabel.text = movie.title
        switch movie.seen {
        case true:
            seenButton.setTitle("Seen", for: .normal)
        case false:
            seenButton.setTitle("Not Seen", for: .normal)
        }
    }
    
    
}
