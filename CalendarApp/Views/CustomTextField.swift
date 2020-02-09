//
//  CustomTextField.swift
//  CalendarApp
//
//  Created by Martin Victory on 08/02/2020.
//  Copyright © 2020 Martin Victory. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {
    
    var borderWidth: CGFloat
    var borderColor: UIColor
    var activeBorderColor: UIColor
    var fontColor: UIColor
    var activeFontColor: UIColor
    
    private lazy var bottomBorder: UIView = {
        let border = UIView()
        border.translatesAutoresizingMaskIntoConstraints = false
        border.backgroundColor = borderColor
        border.layer.cornerRadius = 5
        border.layer.masksToBounds = true
        
        return border
    }()

    override init(frame: CGRect) {
        self.borderWidth = 3
        self.borderColor = UIColor(red: 0.94, green: 0.94, blue: 0.94, alpha: 1.0)
        self.activeBorderColor = UIColor(red: 0.14, green: 0.14, blue: 0.16, alpha: 1.0)
        self.fontColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0)
        self.activeFontColor = UIColor(red: 0.14, green: 0.14, blue: 0.16, alpha: 1.0)

        super.init(frame: frame)

        self.clearButtonMode = .whileEditing
        self.addSubview(bottomBorder)

        layoutBorder()
        
        // Left padding
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        self.leftViewMode = .always
        
        // Font color
        self.textColor = fontColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutBorder() {
        NSLayoutConstraint.activate([
            self.bottomBorder.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -borderWidth),
            self.bottomBorder.rightAnchor.constraint(equalTo: self.rightAnchor),
            self.bottomBorder.leftAnchor.constraint(equalTo: self.leftAnchor),
            self.bottomBorder.heightAnchor.constraint(equalToConstant: borderWidth),
        ])
    }


    // MARK: Change border color based on editing mode
    override func becomeFirstResponder() -> Bool {
        let becomeFirstResponder = super.becomeFirstResponder()
        
        if becomeFirstResponder {
            self.bottomBorder.backgroundColor = self.activeBorderColor
            self.textColor = activeFontColor
        }
        
        return becomeFirstResponder
    }
    
    override func resignFirstResponder() -> Bool {
        let resignFirstResponder = super.resignFirstResponder()
        
        if resignFirstResponder {
            self.bottomBorder.backgroundColor = self.borderColor
            self.textColor = fontColor
        }
        
        return resignFirstResponder
    }
}
