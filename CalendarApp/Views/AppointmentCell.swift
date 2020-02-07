//
//  AppointmentCell.swift
//  CalendarApp
//
//  Created by Martin Victory on 05/02/2020.
//  Copyright © 2020 Martin Victory. All rights reserved.
//

import UIKit

class AppointmentCell: UICollectionViewCell {
    
    var title = "" {
        didSet {
            titleLbl.text = title
        }
    }
    
    var date = "" {
        didSet {
            dateLbl.text = date
        }
    }
    
    var time = "" {
        didSet {
            timeLbl.text = time
        }
    }
    
    
    

    // Top title
    private let titleLbl: UILabel = {
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
    private let dateLbl: UILabel = {
        let label = UILabel()
        label.text = "18 NOV 2020"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor(red: 0.7, green: 0.7, blue: 0.7, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        
//        label.backgroundColor = .red
        
        return label
    }()
   
    // Bottom right time
    private let timeLbl: UILabel = {
        let label = UILabel()
        label.text = "11:00 - 13:00"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor(red: 0.7, green: 0.7, blue: 0.7, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
//        label.backgroundColor = .blue
        label.textAlignment = .right
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.layer.cornerRadius = 10
        contentView.clipsToBounds = true
        contentView.layer.borderColor = UIColor(red: 0.95, green: 0.95, blue: 0.96, alpha: 1.0).cgColor
        contentView.layer.borderWidth = 3

        contentView.addSubview(titleLbl)
        contentView.addSubview(dateLbl)
        contentView.addSubview(timeLbl)
        
        setupLayout()
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            titleLbl.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            titleLbl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            titleLbl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            dateLbl.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 10),
            dateLbl.leadingAnchor.constraint(equalTo: titleLbl.leadingAnchor),
            dateLbl.heightAnchor.constraint(equalToConstant: 20),
            dateLbl.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),

            timeLbl.topAnchor.constraint(equalTo: dateLbl.topAnchor),
            timeLbl.trailingAnchor.constraint(equalTo: titleLbl.trailingAnchor),
            timeLbl.bottomAnchor.constraint(equalTo: dateLbl.bottomAnchor),
            timeLbl.leadingAnchor.constraint(equalTo: dateLbl.trailingAnchor, constant: 10)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
