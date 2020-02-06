//
//  AppointmentCell.swift
//  CalendarApp
//
//  Created by Martin Victory on 05/02/2020.
//  Copyright © 2020 Martin Victory. All rights reserved.
//

import UIKit

class AppointmentCell: UITableViewCell {
    
    // Top title
    private let title: UILabel = {
        let label = UILabel()
        label.text = "Start making user flow for a new mobile application"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = UIColor(red: 0.14, green: 0.14, blue: 0.16, alpha: 1.0)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
//        label.backgroundColor = .yellow
        
        return label
    }()
   
    // Bottom left date
    private let date: UILabel = {
        let label = UILabel()
        label.text = "18 NOV 2020"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor(red: 0.7, green: 0.7, blue: 0.7, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        
//        label.backgroundColor = .red
        
        return label
    }()
   
    // Bottom right time
    private let time: UILabel = {
        let label = UILabel()
        label.text = "11:00 - 13:00"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor(red: 0.7, green: 0.7, blue: 0.7, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
//        label.backgroundColor = .blue
        label.textAlignment = .right
        
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        self.layer.borderColor = UIColor(red: 0.95, green: 0.95, blue: 0.96, alpha: 1.0).cgColor
        self.layer.borderWidth = 3

        self.addSubview(title)
        self.addSubview(date)
        self.addSubview(time)
        
        setupLayout()
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            title.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
//            title.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            date.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 10),
            date.leadingAnchor.constraint(equalTo: title.leadingAnchor),
            date.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15),

            time.topAnchor.constraint(equalTo: date.topAnchor),
            time.trailingAnchor.constraint(equalTo: title.trailingAnchor),
            time.bottomAnchor.constraint(equalTo: date.bottomAnchor),
            time.leadingAnchor.constraint(equalTo: date.trailingAnchor, constant: 10)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
