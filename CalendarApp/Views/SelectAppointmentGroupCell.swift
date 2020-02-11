//
//  SelectAppointmentGroupCell.swift
//  CalendarApp
//
//  Created by Martin Victory on 10/02/2020.
//  Copyright © 2020 Martin Victory. All rights reserved.
//

import UIKit

class SelectAppointmentGroupCell: UICollectionViewCell {

    var groupItem: TaskItem
    
    override init(frame: CGRect) {
        self.groupItem = TaskItem()
        self.groupItem.translatesAutoresizingMaskIntoConstraints = false
        self.groupItem.setBorder(with: UIColor(red: 0.94, green: 0.94, blue: 0.94, alpha: 1.0))

        super.init(frame: frame)

        self.contentView.addSubview(groupItem)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            self.groupItem.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            self.groupItem.rightAnchor.constraint(equalTo: self.contentView.rightAnchor),
            self.groupItem.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            self.groupItem.leftAnchor.constraint(equalTo: self.contentView.leftAnchor),
        ])
    }
    
}
