//
//  ViewController.swift
//  CalendarApp
//
//  Created by Martin Victory on 05/02/2020.
//  Copyright © 2020 Martin Victory. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let appointmentsModel = ["Make changes to the new site design", "Upload Sketch to Zepelin", "Try new icon set", "Start making user flow for a new mobile application", "Make changes to the old site design"]
    
    private var appointmentsTable: UICollectionView!
    private var newAppointmentBtn: NewTaskBtn!
    private var appointmentTitle: AppointmentsTitle!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
        self.view.addSubview(appointmentsTable)
        
        self.newAppointmentBtn = NewTaskBtn(type: .system)
        self.newAppointmentBtn.translatesAutoresizingMaskIntoConstraints = false
        self.newAppointmentBtn.addTarget(self, action: #selector(addNewTask(sender:)), for: .touchUpInside)
        self.view.addSubview(newAppointmentBtn)

        self.appointmentTitle = AppointmentsTitle()
        self.appointmentTitle.translatesAutoresizingMaskIntoConstraints = false
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


}

extension ViewController: UICollectionViewDelegate {
        
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("item \(indexPath.row) slected")
    }

}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appointmentsModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "appointmentCell", for: indexPath) as! AppointmentCell
        cell.title = appointmentsModel[indexPath.row]
        return cell
    }

}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let appointment = appointmentsModel[indexPath.row]
        
        let appointmentTitleSize = CGSize(width: appointmentsTable.bounds.width - 40, height: CGFloat.greatestFiniteMagnitude)
        let appointmentTitleAttr = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 17)]
        
        let estimateTitleSize = NSString(string: appointment).boundingRect(with: appointmentTitleSize, options: .usesLineFragmentOrigin, attributes: appointmentTitleAttr, context: nil)
        
        return CGSize(width: collectionView.bounds.width, height: estimateTitleSize.height + 30 + 30)
    }
}

