//
//  EventResultViewModel.swift
//

import Foundation
import RxCocoa
import EventKit

final class EventResultViewModel: NSObject {
    let eventList = BehaviorRelay<[EKEvent]?>(value: nil)
    
    override init() {
        super.init()
        getEvents()
    }
    
    public func getEvents() {
        // Getting events
        CalendarEventHelper.getEvents(from: Date(), to: Date() + 60*60) { (events, error) in
            guard let events = events else {
                print("error getting events: \(String(describing: error))")
                return
            }
            self.eventList.accept(events)
        }
    }
}
