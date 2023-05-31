//
//  LoginViewController.swift
//

import Foundation
import UIKit
import RxSwift

final class LoginViewController: BaseViewController {
    @IBOutlet private weak var emailTextField: EventTextField!
    @IBOutlet private weak var passwordTextField: EventTextField!
    @IBOutlet private weak var loginButton: EventButton!

    private var viewModel: LoginViewModel?
    var disposeBag: DisposeBag?

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = LoginViewModel()
        setObservables()
    }

    private func setObservables() {
        let disposeBag = DisposeBag()
        emailTextField.configureSubscriptions(disposeBag: disposeBag)
        passwordTextField.configureSubscriptions(disposeBag: disposeBag)

        Observable.combineLatest(emailTextField.isValid, passwordTextField.isValid)
                .asObservable()
                .observe(on: MainScheduler.instance)
                .do(onNext: { [weak self] isEmailValid, isPasswordValid in
                    guard let self = self else { return }
                    let isValid = isEmailValid && isPasswordValid
                    self.loginButton.setState(enabled: isValid)
                })
                .subscribe()
                .disposed(by: disposeBag)

        viewModel?.isLoggedIn
                .asDriver()
                .drive(onNext: { [unowned self] isLoggedIn in
                    if isLoggedIn {
                        self.goToHomeVC()
                    }
                })
                .disposed(by: disposeBag)
                    
        self.disposeBag = disposeBag
    }
    
    @IBAction private func loginPressed(_ sender: UIButton) {
        let email = emailTextField.trimText
        let password = passwordTextField.trimText
        viewModel?.login(email: email, password: password)
    }

    private func goToHomeVC() {
        let homeScreen = R.storyboard.eventResult.eventResultViewController()!
        sceneDelegate?.switchVC(viewController: homeScreen)
    }
}
