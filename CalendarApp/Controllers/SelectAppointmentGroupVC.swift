//
//  SelectAppointmentGroupVC.swift
//  CalendarApp
//
//  Created by Martin Victory on 10/02/2020.
//  Copyright © 2020 Martin Victory. All rights reserved.
//

import UIKit

class SelectAppointmentGroupVC: UIViewController {
    
    var appointmentsService: AppointmentsService!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        self.view = UIView()
        self.view.backgroundColor = .white
       
        // Title
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "Select Group"
        title.font = UIFont.systemFont(ofSize: 40, weight: .semibold)
        self.view.addSubview(title)
        
        // CollectionView
        let groupItems = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
        groupItems.translatesAutoresizingMaskIntoConstraints = false
        groupItems.backgroundColor = .white
        groupItems.delegate = self
        groupItems.dataSource = self
        groupItems.register(SelectAppointmentGroupCell.self, forCellWithReuseIdentifier: "groupCell")
        groupItems.showsVerticalScrollIndicator = false
        self.view.addSubview(groupItems)
        
        // Constrains
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
            title.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -20),
            title.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 20),
            
            groupItems.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 20),
            groupItems.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -20),
            groupItems.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            groupItems.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 20),
        ])
    }

}

extension SelectAppointmentGroupVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension SelectAppointmentGroupVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appointmentsService.groupsCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "groupCell", for: indexPath) as! SelectAppointmentGroupCell
        
        cell.groupItem.text = appointmentsService.appointmentGroup(at: indexPath.row).name
        cell.groupItem.iconBgColor = UIColor(red: 0.95, green: 0.92, blue: 0.99, alpha: 1.0)
        cell.groupItem.iconColor = UIColor(red: 0.55, green: 0.46, blue: 0.71, alpha: 1.0)
        cell.groupItem.icon.font = UIFont.fontAwesome(ofSize: 20, style: .solid)
        cell.groupItem.icon.text = String.fontAwesomeIcon(name: .suitcase)
        
        return cell
    }
    
    
}

extension SelectAppointmentGroupVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 70)
    }
}
