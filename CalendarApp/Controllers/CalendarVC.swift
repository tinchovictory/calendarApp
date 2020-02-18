//
//  CalendarVC.swift
//  CalendarApp
//
//  Created by Martin Victory on 18/02/2020.
//  Copyright © 2020 Martin Victory. All rights reserved.
//

import UIKit
import JTAppleCalendar

class CalendarVC: UIViewController {
    
    private var calendar: JTAppleCalendarView!
    var dismissHandler: ((Date) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        self.view = UIView()
        self.view.backgroundColor = UIColor(red: 0.6, green: 0.39, blue: 0.89, alpha: 1.0)
        
        self.calendar = JTAppleCalendarView()
        self.calendar.translatesAutoresizingMaskIntoConstraints = false
        self.calendar.register(CalendarCell.self, forCellWithReuseIdentifier: "calendarCell")
        self.calendar.register(CalendarHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "calendarHeader")
        self.calendar.ibCalendarDelegate = self
        self.calendar.ibCalendarDataSource = self
        self.calendar.scrollingMode = .stopAtEachCalendarFrame
        self.calendar.scrollDirection = .horizontal
        self.calendar.showsHorizontalScrollIndicator = false
        
        self.calendar.backgroundColor = .none
        self.view.addSubview(calendar)
        
        NSLayoutConstraint.activate([
            self.calendar.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.calendar.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor),
            self.calendar.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor),
            self.calendar.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            self.calendar.heightAnchor.constraint(equalToConstant: 300),
        ])
    }
}

extension CalendarVC: JTAppleCalendarViewDataSource {
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy MM dd"
        let endDate = formatter.date(from: "2050 12 31")!

        return ConfigurationParameters(startDate: Date(), endDate: endDate, numberOfRows: 6, calendar: Calendar.current, generateInDates: .forAllMonths, generateOutDates: .tillEndOfGrid, firstDayOfWeek: .monday, hasStrictBoundaries: nil)
    }
}

extension CalendarVC: JTAppleCalendarViewDelegate {
    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "calendarCell", for: indexPath) as! CalendarCell
        configureCell(view: cell, cellState: cellState)
        return cell
    }
    
    func calendar(_ calendar: JTAppleCalendarView, willDisplay cell: JTAppleCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
        configureCell(view: cell, cellState: cellState)
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        configureCell(view: cell, cellState: cellState)
        if let dismissHandler = dismissHandler {
            dismissHandler(date)
        }
    }

    func calendar(_ calendar: JTAppleCalendarView, didDeselectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        configureCell(view: cell, cellState: cellState)
    }
    
    func calendar(_ calendar: JTAppleCalendarView, shouldSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) -> Bool {
        return isDateValid(date)
    }
    
    func calendar(_ calendar: JTAppleCalendarView, headerViewForDateRange range: (start: Date, end: Date), at indexPath: IndexPath) -> JTAppleCollectionReusableView {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM"
        
        let header = calendar.dequeueReusableJTAppleSupplementaryView(withReuseIdentifier: "calendarHeader", for: indexPath) as! CalendarHeader
       
        header.monthLabel.text = formatter.string(from: range.start)
        
        return header
    }
    
    func calendarSizeForMonths(_ calendar: JTAppleCalendarView?) -> MonthSize? {
        return MonthSize(defaultSize: 60)
    }
    
    func configureCell(view: JTAppleCell?, cellState: CellState) {
       guard let cell = view as? CalendarCell  else { return }
       cell.label.text = cellState.text
       handleCellTextColor(cell: cell, cellState: cellState)
        handleCellSelected(cell: cell, cellState: cellState)
    }
        
    func handleCellTextColor(cell: CalendarCell, cellState: CellState) {
        if cellState.dateBelongsTo == .thisMonth && isDateValid(cellState.date){
            cell.label.textColor = UIColor.white
        } else {
            cell.label.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.3)
        }
        
        // Handle selection
        if cellState.isSelected {
            cell.label.textColor = UIColor.black
        }
    }
    
    func handleCellSelected(cell: CalendarCell, cellState: CellState) {
        if cellState.isSelected {
            cell.selectedView.isHidden = false
        } else {
            cell.selectedView.isHidden = true
        }
    }
    
    func isDateValid(_ date: Date) -> Bool {
        let compareDates = Calendar.current.compare(date, to: Date(), toGranularity: .day)
        if compareDates == .orderedDescending || compareDates == .orderedSame {
            return true
        }
        return false
    }
}
