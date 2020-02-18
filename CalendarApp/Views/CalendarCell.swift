//
//  CalendarCell.swift
//  CalendarApp
//
//  Created by Martin Victory on 18/02/2020.
//  Copyright © 2020 Martin Victory. All rights reserved.
//

import UIKit
import JTAppleCalendar

class CalendarCell: JTAppleCell {
    let label: UILabel
    let selectedView: UIView
    
    override init(frame: CGRect) {
        self.label = UILabel()
        self.selectedView = UIView()
        
        super.init(frame: frame)
        
        self.selectedView.translatesAutoresizingMaskIntoConstraints = false
        self.selectedView.backgroundColor = .white
        self.selectedView.isHidden = true
        self.selectedView.layer.cornerRadius = 15
        self.addSubview(self.selectedView)
        
        self.label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        self.addSubview(self.label)
        

        NSLayoutConstraint.activate([
            self.selectedView.heightAnchor.constraint(equalToConstant: 40),
            self.selectedView.widthAnchor.constraint(equalToConstant: 40),
            self.selectedView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.selectedView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
