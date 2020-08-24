//
//  AddMovieViewController.swift
//  Movie List
//
//  Created by Cody Morley on 8/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class AddMovieViewController: UIViewController {
    @IBOutlet weak var titleField: UITextField!
    var delegate: MovieDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addMovie(_ sender: Any) {
        guard let delegate = delegate,
            let title = titleField.text,
            title != "",
            !title.isEmpty else { return }
        
        delegate.addMovie(title)
    }
    
}
