//
//  AppointmentGroupVC.swift
//  CalendarApp
//
//  Created by Martin Victory on 07/02/2020.
//  Copyright © 2020 Martin Victory. All rights reserved.
//

import UIKit

protocol AppointmentGroupDelegate: class {
    func appointmentGroupDidChanged()
}

class AppointmentGroupVC: UIViewController {
    
    private var groupsList: UICollectionView!
    
    var appointmentsService: AppointmentsService!
    
    weak var appointmentGroupDelegate: AppointmentGroupDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        self.view = UIView()
        self.view.backgroundColor = UIColor(red: 0.14, green: 0.14, blue: 0.16, alpha: 1.0)
        
        self.groupsList = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
        self.groupsList.translatesAutoresizingMaskIntoConstraints = false
        self.groupsList.backgroundColor = .clear
        self.groupsList.delegate = self
        self.groupsList.dataSource = self
        self.groupsList.register(AppointmentGroupCell.self, forCellWithReuseIdentifier: "AppointmentGroupCell")
        self.groupsList.showsVerticalScrollIndicator = false
        
        self.view.addSubview(self.groupsList)
        
        NSLayoutConstraint.activate([
            self.groupsList.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 120),
            self.groupsList.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.groupsList.widthAnchor.constraint(equalToConstant: 50),
            self.groupsList.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

extension AppointmentGroupVC: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath.row < appointmentsService.groupsCount {
            appointmentsService.setSelectedGroup(withId: indexPath.row)
            
            let allCells = collectionView.visibleCells as! [AppointmentGroupCell]
            
            allCells.forEach { cell in cell.isGroupSelected = false }
            
            let cell = collectionView.cellForItem(at: indexPath) as! AppointmentGroupCell
            cell.isGroupSelected = true
            
            // Update appointments
            if let delegate = appointmentGroupDelegate {
                delegate.appointmentGroupDidChanged()
            }
        }
    }
    
}

extension AppointmentGroupVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appointmentsService.groupsCount + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AppointmentGroupCell", for: indexPath) as! AppointmentGroupCell
        
        if indexPath.row < appointmentsService.groupsCount {
            let appointmentGroup = appointmentsService.appointmentGroup(at: indexPath.row)
            cell.groupName = appointmentGroup.name
            
            let color = appointmentGroup.color
            cell.groupColor = UIColor(red: CGFloat(color.r), green: CGFloat(color.g), blue: CGFloat(color.b), alpha: 1.0)

            cell.isGroupSelected = appointmentsService.isSelectedGroup(withId: appointmentGroup.id)
        } else {
            cell.groupName = "+"
            cell.groupColor = UIColor.white
        }

        return cell
    }
    
    
}

extension AppointmentGroupVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 25
    }
}
