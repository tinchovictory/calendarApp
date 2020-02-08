//
//  AppointmentsService.swift
//  CalendarApp
//
//  Created by Martin Victory on 08/02/2020.
//  Copyright © 2020 Martin Victory. All rights reserved.
//

import Foundation

class AppointmentsService {
    private var selectedGroup: Int
    private let groups = [
        AppointmentGroup(id: 0, name: "Work", color: RGBValue(red: 0.6, green: 0.39, blue: 0.89)),
        AppointmentGroup(id: 1, name: "Family", color: RGBValue(red: 0.92, green: 0.73, blue: 0.37)),
        AppointmentGroup(id: 2, name: "School", color: RGBValue(red: 0.44, green: 0.75, blue: 0.81)),
        AppointmentGroup(id: 3, name: "Personal", color: RGBValue(red: 0.80, green: 0.49, blue: 0.36)),
    ]
    private let appointments = [
        0: [
            Appointment(id: 0, title: "Work Make changes to the new site design", date: Date(timeIntervalSinceNow: 432000), startTime: 11, endTime: 13),
            Appointment(id: 1, title: "Work Upload Sketch to Zepelin", date: Date(timeIntervalSinceNow: 432000), startTime: 11, endTime: 13),
            Appointment(id: 2, title: "Work Try new icon set", date: Date(timeIntervalSinceNow: 432000), startTime: 11, endTime: 13),
            Appointment(id: 3, title: "Work Start making user flow for a new mobile application", date: Date(timeIntervalSinceNow: 432000), startTime: 11, endTime: 13),
            Appointment(id: 4, title: "Work Make changes to the old site design", date: Date(timeIntervalSinceNow: 432000), startTime: 11, endTime: 13),
        ],
        1: [
            Appointment(id: 0, title: "Family Make changes to the new site design", date: Date(timeIntervalSinceNow: 432000), startTime: 11, endTime: 13),
            Appointment(id: 1, title: "Family Upload Sketch to Zepelin", date: Date(timeIntervalSinceNow: 432000), startTime: 11, endTime: 13),
            Appointment(id: 2, title: "Family Try new icon set", date: Date(timeIntervalSinceNow: 432000), startTime: 11, endTime: 13),
            Appointment(id: 3, title: "Family Start making user flow for a new mobile application", date: Date(timeIntervalSinceNow: 432000), startTime: 11, endTime: 13),
            Appointment(id: 4, title: "Family Make changes to the old site design", date: Date(timeIntervalSinceNow: 432000), startTime: 11, endTime: 13),
        ],
        2: [
            Appointment(id: 0, title: "School Make changes to the new site design", date: Date(timeIntervalSinceNow: 432000), startTime: 11, endTime: 13),
            Appointment(id: 1, title: "School Upload Sketch to Zepelin", date: Date(timeIntervalSinceNow: 432000), startTime: 11, endTime: 13),
            Appointment(id: 2, title: "School Try new icon set", date: Date(timeIntervalSinceNow: 432000), startTime: 11, endTime: 13),
            Appointment(id: 3, title: "School Start making user flow for a new mobile application", date: Date(timeIntervalSinceNow: 432000), startTime: 11, endTime: 13),
            Appointment(id: 4, title: "School Make changes to the old site design", date: Date(timeIntervalSinceNow: 432000), startTime: 11, endTime: 13),
        ],
        3: [
            Appointment(id: 0, title: "Personal Make changes to the new site design", date: Date(timeIntervalSinceNow: 432000), startTime: 11, endTime: 13),
            Appointment(id: 1, title: "Personl Upload Sketch to Zepelin", date: Date(timeIntervalSinceNow: 432000), startTime: 11, endTime: 13),
            Appointment(id: 2, title: "Personal Try new icon set", date: Date(timeIntervalSinceNow: 432000), startTime: 11, endTime: 13),
            Appointment(id: 3, title: "Personal Start making user flow for a new mobile application", date: Date(timeIntervalSinceNow: 432000), startTime: 11, endTime: 13),
            Appointment(id: 4, title: "Personal Make changes to the old site design", date: Date(timeIntervalSinceNow: 432000), startTime: 11, endTime: 13),
        ]
    ]
    
    var groupsCount: Int {
        return groups.count
    }
    
    var appointmentsCount: Int {
        return getAppointments().count
    }
    
    init() {
        self.selectedGroup = 0
    }
    
    func setSelectedGroup(withId id: Int) {
        self.selectedGroup = id
    }
    
    func isSelectedGroup(withId id: Int) -> Bool {
        return self.selectedGroup == id
    }
    
    func appointmentGroup(at index: Int) -> AppointmentGroup {
        if index < 0 || index >= groupsCount {
            // TODO: Throw error
        }
        return groups[index]
    }
    
    func getAppointments() -> [Appointment] {
        if !appointments.keys.contains(selectedGroup) {
            // TODO: Throw error
        }
        return appointments[selectedGroup]!
    }
    
    func appointment(at index: Int) -> Appointment {
        if index < 0 || index >= appointmentsCount {
            // TODO: Throw error
        }
        return getAppointments()[index]
    }
    
}
