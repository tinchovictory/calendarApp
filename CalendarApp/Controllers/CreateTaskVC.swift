//
//  CreateTaskVC.swift
//  CalendarApp
//
//  Created by Martin Victory on 08/02/2020.
//  Copyright © 2020 Martin Victory. All rights reserved.
//

import UIKit
import FontAwesome_swift

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
        self.dateItem.iconColor = UIColor(red: 0.69, green: 0.64, blue: 0.39, alpha: 1.0)
        self.dateItem.icon.font = UIFont.fontAwesome(ofSize: 20, style: .solid)
        self.dateItem.icon.text = String.fontAwesomeIcon(name: .calendar)
        self.dateItem.onTap = { print("tap date") }
        self.view.addSubview(self.dateItem)
        
        // Time
        self.timeItem = TaskItem()
        self.timeItem.translatesAutoresizingMaskIntoConstraints = false
        self.timeItem.text = "1:00 pm - 3:30 pm"
        self.timeItem.iconBgColor = UIColor(red: 0.98, green: 0.94, blue: 0.93, alpha: 1.0)
        self.timeItem.iconColor = UIColor(red: 0.62, green: 0.42, blue: 0.45, alpha: 1.0)
        self.timeItem.icon.font = UIFont.fontAwesome(ofSize: 20, style: .solid)
        self.timeItem.icon.text = String.fontAwesomeIcon(name: .clock)
        self.view.addSubview(self.timeItem)
        
        // Group
        self.groupItem = TaskItem()
        self.groupItem.translatesAutoresizingMaskIntoConstraints = false
        self.groupItem.text = "Work"
        self.groupItem.iconBgColor = UIColor(red: 0.95, green: 0.92, blue: 0.99, alpha: 1.0)
        self.groupItem.iconColor = UIColor(red: 0.55, green: 0.46, blue: 0.71, alpha: 1.0)
        self.groupItem.icon.font = UIFont.fontAwesome(ofSize: 20, style: .solid)
        self.groupItem.icon.text = String.fontAwesomeIcon(name: .suitcase)
        self.groupItem.setBorder(with: UIColor(red: 0.94, green: 0.94, blue: 0.94, alpha: 1.0))
        addGroupItemIcon()
        self.view.addSubview(self.groupItem)

        // Notification
        self.notificationItem = TaskItem()
        self.notificationItem.translatesAutoresizingMaskIntoConstraints = false
        self.notificationItem.text = "Remind me"
        self.notificationItem.iconBgColor = UIColor(red: 0.88, green: 0.99, blue: 0.97, alpha: 1.0)
        self.notificationItem.iconColor = UIColor(red: 0.52, green: 0.71, blue: 0.73, alpha: 1.0)
        self.notificationItem.icon.font = UIFont.fontAwesome(ofSize: 20, style: .solid)
        self.notificationItem.icon.text = String.fontAwesomeIcon(name: .bell)
        self.notificationItem.setBorder(with: UIColor(red: 0.94, green: 0.94, blue: 0.94, alpha: 1.0))
        addNotificationSwitch()
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
    
    private func addGroupItemIcon() {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        label.font = UIFont.fontAwesome(ofSize: 20, style: .solid)
        label.text = String.fontAwesomeIcon(name: .chevronRight)
        label.textColor = UIColor(red: 0.34, green: 0.34, blue: 0.35, alpha: 1.0)
        
        self.groupItem.rightView.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: self.groupItem.rightView.centerYAnchor),
            label.heightAnchor.constraint(equalToConstant: 30),
            label.widthAnchor.constraint(equalToConstant: 30),
            label.rightAnchor.constraint(equalTo: self.groupItem.rightView.rightAnchor),
            label.leftAnchor.constraint(equalTo: self.groupItem.rightView.leftAnchor),
        ])
    }
    
    private func addNotificationSwitch() {
        let toggle = UISwitch()
        toggle.translatesAutoresizingMaskIntoConstraints = false
        toggle.onTintColor = UIColor(red: 0.42, green: 0.78, blue: 0.86, alpha: 1.0)
        
        self.notificationItem.rightView.addSubview(toggle)
        NSLayoutConstraint.activate([
            toggle.centerYAnchor.constraint(equalTo: self.notificationItem.rightView.centerYAnchor),
            toggle.rightAnchor.constraint(equalTo: self.notificationItem.rightView.rightAnchor),
            toggle.leftAnchor.constraint(equalTo: self.notificationItem.rightView.leftAnchor),
        ])
    }
}
