//
//  ViewController.swift
//  RxLoginPageMVVM
//
//  Created by Yıldırımhan Atçıoğlu on 13.01.2019.
//  Copyright © 2019 Yıldırımhan Atçıoğlu. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var informationLabel: UILabel!
    
    let disposeBag = DisposeBag()
    var loginViewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.informationLabel.text = "Email or Password invalid!"
        emailTextField.rx.text
            .map({$0 ?? ""})
            .bind(to:self.loginViewModel.emailText)
            .disposed(by: disposeBag)
        
        passwordTextField.rx.text
            .map({$0 ?? ""})
            .bind(to: self.loginViewModel.passwordText)
            .disposed(by: disposeBag)
        
        loginViewModel.isValid.bind(to: self.loginButton.rx.isEnabled).disposed(by: disposeBag)
        
        loginViewModel.isValid.bind(to: self.informationLabel.rx.isHidden).disposed(by: disposeBag)
    }


}

