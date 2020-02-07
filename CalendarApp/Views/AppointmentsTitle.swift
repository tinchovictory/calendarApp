//
//  AppointmentsTitle.swift
//  CalendarApp
//
//  Created by Martin Victory on 07/02/2020.
//  Copyright © 2020 Martin Victory. All rights reserved.
//

import UIKit

class AppointmentsTitle: UIView {
    private let headerLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "TASKS LIST"
        label.font = UIFont.boldSystemFont(ofSize: 15)
//        label.textColor = UIColor(red: 0.7, green: 0.71, blue: 0.72, alpha: 1.0)
        label.textColor = UIColor(red: 0.55, green: 0.55, blue: 0.55, alpha: 1.0)
        
        return label
    }()
    
    private let titleLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "Work"
        label.font = UIFont.systemFont(ofSize: 45, weight: .semibold)
        label.textColor = UIColor(red: 0.14, green: 0.14, blue: 0.16, alpha: 1.0)
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(headerLbl)
        self.addSubview(titleLbl)
        
        NSLayoutConstraint.activate([
            headerLbl.topAnchor.constraint(equalTo: self.topAnchor),
            headerLbl.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            headerLbl.trailingAnchor.constraint(equalTo: self.trailingAnchor),

            titleLbl.topAnchor.constraint(equalTo: headerLbl.bottomAnchor, constant: 5),
            titleLbl.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            titleLbl.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            titleLbl.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
