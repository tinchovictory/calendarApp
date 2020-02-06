//
//  ViewController.swift
//  CalendarApp
//
//  Created by Martin Victory on 05/02/2020.
//  Copyright © 2020 Martin Victory. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let appointmentsModel = ["Make changes to the new site design", "Upload Sketch to Zepelin", "Try new icon set", "Start making user flow for a new mobile application", "Make changes to the old site design"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    override func loadView() {
        self.view = UIView()
        self.view.backgroundColor = .white
        
        let appointmentsTable = UITableView()
        appointmentsTable.separatorStyle = .none
//        appointmentsTable.alwaysBounceVertical = false
        appointmentsTable.delegate = self
        appointmentsTable.dataSource = self
        appointmentsTable.register(AppointmentCell.self, forCellReuseIdentifier: "appointmentCell")
        
        self.view.addSubview(appointmentsTable)
        
        appointmentsTable.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            appointmentsTable.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
            appointmentsTable.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -20),
            appointmentsTable.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            appointmentsTable.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 20),
        ])
    }


}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("row \(indexPath.row) selected")
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appointmentsModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "appointmentCell", for: indexPath) as! AppointmentCell
//        cell.textLabel?.text = appointmentsModel[indexPath.row]
        return cell
    }
    
}

