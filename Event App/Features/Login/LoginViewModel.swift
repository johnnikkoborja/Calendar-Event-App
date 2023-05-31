//
//  LoginViewModel.swift
//

import Foundation
import RxCocoa

final class LoginViewModel: NSObject {
    let isLoggedIn = BehaviorRelay<Bool>(value: false)
    let error = BehaviorRelay<String>(value: "")

    func login(email: String, password: String) {
        self.isLoggedIn.accept(true)
    }
}
