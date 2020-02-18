//
//  CalendarVC.swift
//  CalendarApp
//
//  Created by Martin Victory on 18/02/2020.
//  Copyright © 2020 Martin Victory. All rights reserved.
//

import UIKit

class CalendarVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        let label = UILabel()
        label.text = "Calendar"
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            label.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
}
