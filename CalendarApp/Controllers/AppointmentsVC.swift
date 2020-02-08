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
    private var appointmentGroupVC: AppointmentGroupVC!
    
    private let appointmentsService = AppointmentsService()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Add AppointmentListVC
        self.appointmentListVC = AppointmentListVC()
        self.appointmentListVC.appointmentsService = appointmentsService
        addChild(self.appointmentListVC)
        appointmentListVC.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(appointmentListVC.view)
        
        // Add AppointmentGroupVC
        self.appointmentGroupVC = AppointmentGroupVC()
        self.appointmentGroupVC.appointmentsService = appointmentsService
        self.appointmentGroupVC.appointmentGroupDelegate = self
        addChild(self.appointmentGroupVC)
        appointmentGroupVC.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(appointmentGroupVC.view)
        
        NSLayoutConstraint.activate([
            appointmentListVC.view.topAnchor.constraint(equalTo: self.view.topAnchor),
            appointmentListVC.view.rightAnchor.constraint(equalTo: self.appointmentGroupVC.view.leftAnchor),
            appointmentListVC.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            appointmentListVC.view.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            
            appointmentGroupVC.view.topAnchor.constraint(equalTo: self.view.topAnchor),
            appointmentGroupVC.view.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            appointmentGroupVC.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            appointmentGroupVC.view.widthAnchor.constraint(equalToConstant: 100),
        ])
        
        appointmentListVC.didMove(toParent: self)
        appointmentGroupVC.didMove(toParent: self)
    }
    
}

extension AppointmentsVC: AppointmentGroupDelegate {
    func appointmentGroupDidChanged() {
        appointmentListVC.reloadAppointmentsList()
    }
}
