//
//  AppointmentGroupVC.swift
//  CalendarApp
//
//  Created by Martin Victory on 07/02/2020.
//  Copyright © 2020 Martin Victory. All rights reserved.
//

import UIKit

class AppointmentGroupVC: UIViewController {
    
    private var groupsList: UICollectionView!
    
    private let groupsModel = ["Work", "Family", "School", "Personal"]
    private let groupsColor = [RGBValue(red: 0.6, green: 0.39, blue: 0.89), RGBValue(red: 0.92, green: 0.73, blue: 0.37), RGBValue(red: 0.44, green: 0.75, blue: 0.81), RGBValue(red: 0.80, green: 0.49, blue: 0.36),]
    private let selectedGroup = [true, false, false, false]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
        
        if indexPath.row < groupsModel.count {
            let allCells = collectionView.visibleCells as! [AppointmentGroupCell]
            
            allCells.forEach { cell in cell.isGroupSelected = false }
            
            let cell = collectionView.cellForItem(at: indexPath) as! AppointmentGroupCell
            cell.isGroupSelected = true
        }
    }
    
}

extension AppointmentGroupVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groupsModel.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AppointmentGroupCell", for: indexPath) as! AppointmentGroupCell
        
        if indexPath.row < groupsModel.count {
            cell.groupName = groupsModel[indexPath.row]
            
            let color = groupsColor[indexPath.row]
            cell.groupColor = UIColor(red: CGFloat(color.r), green: CGFloat(color.g), blue: CGFloat(color.b), alpha: 1.0)

            cell.isGroupSelected = selectedGroup[indexPath.row]
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
