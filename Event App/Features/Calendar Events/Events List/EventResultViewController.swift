//
//  EventResultViewController.swift
//

import Foundation
import UIKit
import RxSwift
import EventKit
import EventKitUI

final class EventResultViewController: BaseViewController, EKEventEditViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var disposeBag: DisposeBag?
    fileprivate var events = [EKEvent]()
    fileprivate static let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy HH:mm"
        return formatter
    }()
    
    var selectedEvent: EKEvent?
    var viewModel: EventResultViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(R.nib.eventResultCell)
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.navigationItem.backButtonDisplayMode = .minimal
        
        viewModel = EventResultViewModel()
        setObservables()
    }
    
    private func setObservables() {
        let disposeBag = DisposeBag()
        
        viewModel?.eventList
            .asDriver()
            .drive(onNext: { [weak self] list in
                guard let self = self else { return }
                guard let updatedList = list else { return }
                
                self.events = updatedList
                self.tableView?.reloadData()
            })
            .disposed(by: disposeBag)
        
        self.disposeBag = disposeBag
    }
    
    // MARK: - Actions
    @IBAction func createEvent(_ sender: UIButton) {
        CalendarEventHelper.getEventStore().requestAccess( to: EKEntityType.event, completion:{(granted, error) in
            DispatchQueue.main.async {
                if (granted) && (error == nil) {
                    let event = CalendarEventHelper.newEvent()
                    
                    let eventController = EKEventEditViewController()
                    eventController.event = event
                    eventController.eventStore = CalendarEventHelper.getEventStore()
                    eventController.editViewDelegate = self
                    self.present(eventController, animated: true, completion: nil)
                    
                }
            }
        })
    }
    
    func eventEditViewController(_ controller: EKEventEditViewController, didCompleteWith action: EKEventEditViewAction) {
        controller.dismiss(animated: true, completion: nil)
        viewModel?.getEvents()
    }
    
    func editEvent() {
        CalendarEventHelper.getEventStore().requestAccess( to: EKEntityType.event, completion:{(granted, error) in
            DispatchQueue.main.async {
                if (granted) && (error == nil) {
                    guard let event = self.selectedEvent else { return }
                    CalendarEventHelper.getEvent(with: event.calendarItemIdentifier, completion: { event, error in
                        let eventController = EKEventEditViewController()
                        eventController.event = event
                        eventController.eventStore = CalendarEventHelper.getEventStore()
                        eventController.editViewDelegate = self
                        self.present(eventController, animated: true, completion: nil)
                    })
                }
            }
        })
    }
    
    func deleteEvent() {
        guard let event = self.selectedEvent else { return }
        let alertController = UIAlertController(title: "Event \(event.calendarItemIdentifier)", message: nil, preferredStyle: .alert)
        let editAction = UIAlertAction(title: "Edit", style: .default, handler: { (action) -> Void in
            self.editEvent()
        })
        
        let deleteAction = UIAlertAction(title: "Delete", style: .default, handler: { (action) -> Void in
            CalendarEventHelper.deleteEvent(with: event.calendarItemIdentifier, span: .thisEvent, completion: { error in
                self.viewModel?.getEvents()
            })
        })
        
        alertController.addAction(deleteAction)
        alertController.addAction(editAction)
        
        present(alertController, animated: true, completion: nil)
    }
}

extension EventResultViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedEvent = viewModel?.eventList.value?[indexPath.row] ?? nil
        deleteEvent()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let topSeparator = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 2))
        topSeparator.backgroundColor = R.color.off_black()
        return topSeparator
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 2
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let bottomSeparator = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 2))
        bottomSeparator.backgroundColor = R.color.off_black()
        return bottomSeparator
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 2
    }
}

extension EventResultViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.eventResultCell, for: indexPath), events.count > 0 {
            cell.configure(with: events[indexPath.row])
            
            return cell
        }
        return UITableViewCell()
    }
}
