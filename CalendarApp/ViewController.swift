//
//  ViewController.swift
//  CalendarApp
//
//  Created by Martin Victory on 05/02/2020.
//  Copyright © 2020 Martin Victory. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let appointmentsModel = ["Appointment 1", "Appointment 2", "Appointment 3"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    override func loadView() {
        self.view = UIView()
        self.view.backgroundColor = .white
        
        let appointmentsTable = UITableView()
        appointmentsTable.delegate = self
        appointmentsTable.dataSource = self
        appointmentsTable.register(UITableViewCell.self, forCellReuseIdentifier: "appointmentCell")
        
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
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appointmentsModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "appointmentCell", for: indexPath)
        cell.textLabel?.text = appointmentsModel[indexPath.row]
        return cell
    }
    
}

