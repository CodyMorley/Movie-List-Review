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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addMovie(_ sender: Any) {
        guard let title = titleField.text,
            title != "",
            !title.isEmpty else { return }
        
        NotificationCenter.default.post(name: .addMovie,
                                        object: nil,
                                        userInfo: ["title" : "\(title)"])
    }
    
}
