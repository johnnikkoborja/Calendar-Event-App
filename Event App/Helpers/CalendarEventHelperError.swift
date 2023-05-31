//
//  CalendarEventHelperError.swift
//

import Foundation

public enum CalendarEventHelperError: Error {
    case authorizationFailed(reason: AuthorizationFailureReason)
    
    public enum AuthorizationFailureReason {
        case authorizationDenied
        case authorizationRestricted
    }
}


// MARK: - Error Descriptions
extension CalendarEventHelperError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .authorizationFailed(let reason):
            return reason.localizedDescription
        }
    }
}

extension CalendarEventHelperError.AuthorizationFailureReason {
    var localizedDescription: String {
        switch self {
        case .authorizationDenied:
            return NSLocalizedString("authorization_denied", comment: "Calendar access authorization was denied")
        case .authorizationRestricted:
            return NSLocalizedString("authorization_restricted", comment: "Calendar access authorization is restricted")
        }
    }
}
