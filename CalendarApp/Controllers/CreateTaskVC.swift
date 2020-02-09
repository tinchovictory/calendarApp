//
//  CreateTaskVC.swift
//  CalendarApp
//
//  Created by Martin Victory on 08/02/2020.
//  Copyright © 2020 Martin Victory. All rights reserved.
//

import UIKit

class CreateTaskVC: UIViewController {
    
    private var dateItem: TaskItem!
    private var timeItem: TaskItem!
    private var groupItem: TaskItem!
    private var notificationItem: TaskItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Dissmiss keyboard on tap outside text field
        let tapGesture = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        self.view.addGestureRecognizer(tapGesture)
    }

    override func loadView() {
        self.view = UIView()
        self.view.backgroundColor = .white

        // Top title
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "Create\nNew Task"
        title.font = UIFont.systemFont(ofSize: 40, weight: .semibold)
        title.numberOfLines = 0
        self.view.addSubview(title)
       
        // Text field
        let textField = CustomTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        textField.placeholder = "Task Name"
        self.view.addSubview(textField)
       
        // Date
        self.dateItem = TaskItem()
        self.dateItem.translatesAutoresizingMaskIntoConstraints = false
        self.dateItem.text = "Friday 28, November"
        self.dateItem.iconBgColor = UIColor(red: 0.99, green: 0.96, blue: 0.88, alpha: 1.0)
        self.dateItem.onTap = { print("tap date") }
        self.view.addSubview(self.dateItem)
        
        // Time
        self.timeItem = TaskItem()
        self.timeItem.translatesAutoresizingMaskIntoConstraints = false
        self.timeItem.text = "1:00 pm - 3:30 pm"
        self.timeItem.iconBgColor = UIColor(red: 0.98, green: 0.94, blue: 0.93, alpha: 1.0)
        self.view.addSubview(self.timeItem)
        
        // Group
        self.groupItem = TaskItem()
        self.groupItem.translatesAutoresizingMaskIntoConstraints = false
        self.groupItem.text = "Work"
        self.groupItem.iconBgColor = UIColor(red: 0.95, green: 0.92, blue: 0.99, alpha: 1.0)
        self.groupItem.layer.borderColor = UIColor(red: 0.94, green: 0.94, blue: 0.94, alpha: 1.0).cgColor
        self.groupItem.layer.borderWidth = 3
        self.groupItem.layer.cornerRadius = 15
        self.groupItem.layer.masksToBounds = true
        self.view.addSubview(self.groupItem)

        // Notification
        self.notificationItem = TaskItem()
        self.notificationItem.translatesAutoresizingMaskIntoConstraints = false
        self.notificationItem.text = "Remind me"
        self.notificationItem.iconBgColor = UIColor(red: 0.88, green: 0.99, blue: 0.97, alpha: 1.0)
        self.notificationItem.layer.borderColor = UIColor(red: 0.94, green: 0.94, blue: 0.94, alpha: 1.0).cgColor
        self.notificationItem.layer.borderWidth = 3
        self.notificationItem.layer.cornerRadius = 15
        self.notificationItem.layer.masksToBounds = true
        self.view.addSubview(self.notificationItem)
        
        // Create button
        let createBtn = LargeBtn(type: .system)
        createBtn.translatesAutoresizingMaskIntoConstraints = false
        createBtn.setTitle("CREATE TASK", for: .normal)
        createBtn.backgroundColor = UIColor(red: 0.14, green: 0.14, blue: 0.16, alpha: 1.0)
        createBtn.addTarget(self, action: #selector(tapCreateTask(sender:)), for: .touchUpInside)
        self.view.addSubview(createBtn)
        

        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
            title.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -30),
            title.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 30),
            
            textField.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 20),
            textField.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -30),
            textField.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 30),
            textField.heightAnchor.constraint(equalToConstant: 50),
            
            dateItem.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20),
            dateItem.leftAnchor.constraint(equalTo: textField.leftAnchor),
            dateItem.rightAnchor.constraint(equalTo: textField.rightAnchor),

            timeItem.topAnchor.constraint(equalTo: dateItem.bottomAnchor, constant: 5),
            timeItem.leftAnchor.constraint(equalTo: textField.leftAnchor),
            timeItem.rightAnchor.constraint(equalTo: textField.rightAnchor),

            groupItem.topAnchor.constraint(equalTo: timeItem.bottomAnchor, constant: 30),
            groupItem.leftAnchor.constraint(equalTo: textField.leftAnchor),
            groupItem.rightAnchor.constraint(equalTo: textField.rightAnchor),

            notificationItem.topAnchor.constraint(equalTo: groupItem.bottomAnchor, constant: 15),
            notificationItem.leftAnchor.constraint(equalTo: textField.leftAnchor),
            notificationItem.rightAnchor.constraint(equalTo: textField.rightAnchor),
            
            createBtn.leftAnchor.constraint(equalTo: textField.leftAnchor),
            createBtn.rightAnchor.constraint(equalTo: textField.rightAnchor),
            createBtn.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
    
    @objc private func tapCreateTask(sender: LargeBtn) {
        print("create task")
    }
}
