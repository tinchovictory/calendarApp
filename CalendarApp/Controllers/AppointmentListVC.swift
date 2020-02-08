//
//  ViewController.swift
//  CalendarApp
//
//  Created by Martin Victory on 05/02/2020.
//  Copyright © 2020 Martin Victory. All rights reserved.
//

import UIKit

class AppointmentListVC: UIViewController {
    
    private var appointmentsTable: UICollectionView!
    private var newAppointmentBtn: NewTaskBtn!
    private var appointmentTitle: AppointmentsTitle!
    
    var appointmentsService: AppointmentsService!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func loadView() {
        self.view = UIView()
        self.view.backgroundColor = .white
        
        self.appointmentsTable = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
        self.appointmentsTable.backgroundColor = .white
        self.appointmentsTable.delegate = self
        self.appointmentsTable.dataSource = self
        self.appointmentsTable.register(AppointmentCell.self, forCellWithReuseIdentifier: "appointmentCell")
        self.appointmentsTable.translatesAutoresizingMaskIntoConstraints = false
        self.appointmentsTable.alwaysBounceVertical = true
        self.appointmentsTable.showsVerticalScrollIndicator = false
        self.view.addSubview(appointmentsTable)
        
        self.newAppointmentBtn = NewTaskBtn(type: .system)
        self.newAppointmentBtn.translatesAutoresizingMaskIntoConstraints = false
        let groupColor = appointmentsService.appointmentGroup.color
        self.newAppointmentBtn.backgroundColor = UIColor(red: CGFloat(groupColor.r), green: CGFloat(groupColor.g), blue: CGFloat(groupColor.b), alpha: 1.0)
        self.newAppointmentBtn.addTarget(self, action: #selector(addNewTask(sender:)), for: .touchUpInside)
        self.view.addSubview(newAppointmentBtn)

        self.appointmentTitle = AppointmentsTitle()
        self.appointmentTitle.translatesAutoresizingMaskIntoConstraints = false
        self.appointmentTitle.title = appointmentsService.appointmentGroup.name
        self.view.addSubview(appointmentTitle)

        NSLayoutConstraint.activate([
            appointmentsTable.topAnchor.constraint(equalTo: appointmentTitle.bottomAnchor, constant: 20),
            appointmentsTable.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -20),
            appointmentsTable.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 20),
            
            newAppointmentBtn.topAnchor.constraint(equalTo: appointmentsTable.bottomAnchor, constant: 20),
            newAppointmentBtn.rightAnchor.constraint(equalTo: appointmentsTable.rightAnchor),
            newAppointmentBtn.leftAnchor.constraint(equalTo: appointmentsTable.leftAnchor),
            newAppointmentBtn.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            
            appointmentTitle.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
            appointmentTitle.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -20),
            appointmentTitle.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 20),
        ])
    }
    
    
    @objc private func addNewTask(sender: UIButton) {
        print("Add new task")
    }

    func reloadAppointmentsList() {
        self.appointmentsTable.reloadData()
        self.appointmentTitle.title = appointmentsService.appointmentGroup.name
        
        let groupColor = appointmentsService.appointmentGroup.color
        self.newAppointmentBtn.backgroundColor = UIColor(red: CGFloat(groupColor.r), green: CGFloat(groupColor.g), blue: CGFloat(groupColor.b), alpha: 1.0)
    }

}

extension AppointmentListVC: UICollectionViewDelegate {
        
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("item \(indexPath.row) slected")
    }

}

extension AppointmentListVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appointmentsService.appointmentsCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "appointmentCell", for: indexPath) as! AppointmentCell
       
        let appointment = appointmentsService.appointment(at: indexPath.row)
        cell.title = appointment.title
        cell.time = "\(appointment.startTime):00 - \(appointment.endTime):00"
        
        return cell
    }

}

extension AppointmentListVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let appointment = appointmentsService.appointment(at: indexPath.row)
        
        let appointmentTitleSize = CGSize(width: appointmentsTable.bounds.width - 40, height: CGFloat.greatestFiniteMagnitude)
        let appointmentTitleAttr = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 17)]
        
        let estimateTitleSize = NSString(string: appointment.title).boundingRect(with: appointmentTitleSize, options: .usesLineFragmentOrigin, attributes: appointmentTitleAttr, context: nil)
        
        return CGSize(width: collectionView.bounds.width, height: estimateTitleSize.height + 30 + 30)
    }
}

