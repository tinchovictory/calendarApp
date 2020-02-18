//
//  CalendarHeader.swift
//  CalendarApp
//
//  Created by Martin Victory on 18/02/2020.
//  Copyright © 2020 Martin Victory. All rights reserved.
//

import UIKit
import JTAppleCalendar

class CalendarHeader: JTAppleCollectionReusableView {

    let monthLabel: UILabel
    
    private let DaysNames = ["Mo", "Tu", "We", "Th", "Fr", "Sa", "Su"]

    override init(frame: CGRect) {
        self.monthLabel = UILabel()
        
        super.init(frame: frame)
       
        self.backgroundColor = UIColor(red: 0.5, green: 0.32, blue: 0.73, alpha: 1.0)
        
        self.monthLabel.translatesAutoresizingMaskIntoConstraints = false
        self.monthLabel.textColor = .white
        self.monthLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        self.addSubview(monthLabel)
        
        let dates = UIStackView()
        dates.translatesAutoresizingMaskIntoConstraints = false
        dates.axis = .horizontal
        dates.distribution = .fillEqually
        dates.alignment = .center
        DaysNames.forEach{ name in
            dates.addArrangedSubview(dayToLabel(day: name))
        }
        self.addSubview(dates)
        
        NSLayoutConstraint.activate([
            self.monthLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
//            self.monthLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.monthLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            dates.topAnchor.constraint(equalTo: self.monthLabel.bottomAnchor, constant: 10),
            dates.leftAnchor.constraint(equalTo: self.leftAnchor),
            dates.rightAnchor.constraint(equalTo: self.rightAnchor),
            dates.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
        ])
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func dayToLabel(day: String) -> UILabel {
        let label = UILabel()
        label.text = day
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: UIFont.systemFontSize, weight: .light)
        return label
    }
    
}
