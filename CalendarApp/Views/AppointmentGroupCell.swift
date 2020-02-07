//
//  AppointmentGroupCell.swift
//  CalendarApp
//
//  Created by Martin Victory on 07/02/2020.
//  Copyright © 2020 Martin Victory. All rights reserved.
//

import UIKit

class AppointmentGroupCell: UICollectionViewCell {
    
    var groupName: String! {
        didSet {
            if let firstLetter = groupName.first {
                groupNameLbl.text = String(firstLetter)
            }
        }
    }
    
    private let groupNameLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "W"
        label.font = UIFont.systemFont(ofSize: 17, weight: .heavy)
        label.textAlignment = .center
        label.textColor = UIColor.yellow

        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        self.contentView.backgroundColor = UIColor(red: 0.2, green: 0.22, blue: 0.27, alpha: 1.0)
        self.contentView.layer.cornerRadius = 10
        self.contentView.clipsToBounds = true
        self.contentView.layer.shadowPath = UIBezierPath(roundedRect: self.contentView.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath
        self.contentView.layer.shadowColor = UIColor.black.cgColor
        self.contentView.layer.shadowOpacity = 0.5
        self.contentView.layer.shadowOffset = CGSize(width: 0, height: 5)
        self.contentView.layer.shadowRadius = 1
        self.contentView.layer.masksToBounds = false
        
        self.contentView.addSubview(groupNameLbl)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            groupNameLbl.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            groupNameLbl.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            groupNameLbl.widthAnchor.constraint(equalToConstant: 30),
            groupNameLbl.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
}
