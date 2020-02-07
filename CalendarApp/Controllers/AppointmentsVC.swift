//
//  AppointmentsVC.swift
//  CalendarApp
//
//  Created by Martin Victory on 07/02/2020.
//  Copyright © 2020 Martin Victory. All rights reserved.
//

import UIKit

class AppointmentsVC: UIViewController {
    
    private var appointmentListVC: AppointmentListVC!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.appointmentListVC = AppointmentListVC()
        addChild(self.appointmentListVC)
        appointmentListVC.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(appointmentListVC.view)
        
        NSLayoutConstraint.activate([
            appointmentListVC.view.topAnchor.constraint(equalTo: self.view.topAnchor),
            appointmentListVC.view.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -100),
            appointmentListVC.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            appointmentListVC.view.leftAnchor.constraint(equalTo: self.view.leftAnchor),
        ])
        
        appointmentListVC.didMove(toParent: self)
    }
    
}
