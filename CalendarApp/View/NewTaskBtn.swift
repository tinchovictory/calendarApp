//
//  NewTaskBtn.swift
//  CalendarApp
//
//  Created by Martin Victory on 06/02/2020.
//  Copyright © 2020 Martin Victory. All rights reserved.
//

import UIKit

class NewTaskBtn: UIButton {
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: super.intrinsicContentSize.width, height: super.intrinsicContentSize.height + 20)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor(red: 0.61, green: 0.4, blue: 0.89, alpha: 1.0)
        self.layer.cornerRadius = 10
        let title = NSAttributedString(string: "+ Add New Task", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17), NSAttributedString.Key.foregroundColor: UIColor.white])
        self.setAttributedTitle(title, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
