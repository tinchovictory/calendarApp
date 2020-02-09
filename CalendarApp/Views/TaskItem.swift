//
//  TaskItem.swift
//  CalendarApp
//
//  Created by Martin Victory on 09/02/2020.
//  Copyright © 2020 Martin Victory. All rights reserved.
//

import UIKit

class TaskItem: UIView {
    
    var iconBgColor: UIColor! {
        didSet {
            iconView.backgroundColor = iconBgColor
        }
    }
    var iconColor: UIColor!
    var text: String! {
        didSet {
            textField.text = text
        }
    }
    
    private lazy var iconView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = iconBgColor
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        
        return view
    }()
    
    private lazy var textField: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 0.14, green: 0.14, blue: 0.16, alpha: 1.0)
        label.text = text
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)

        return label
    }()
    

    override init(frame: CGRect) {
        self.iconBgColor = UIColor(red: 0.99, green: 0.96, blue: 0.88, alpha: 1.0)
        self.iconColor = UIColor(red: 0.74, green: 0.67, blue: 0.36, alpha: 1.0)
        self.text = "Friday 28, November"
        
        super.init(frame: frame)
        
        self.addSubview(iconView)
        self.addSubview(textField)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            iconView.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            iconView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            iconView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15),
            iconView.heightAnchor.constraint(equalToConstant: 40),
            iconView.widthAnchor.constraint(equalToConstant:  40),
            
            textField.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            textField.heightAnchor.constraint(equalToConstant: 30),
            textField.leftAnchor.constraint(equalTo: iconView.rightAnchor, constant: 20),
            textField.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20)
        ])
    }
    
}
