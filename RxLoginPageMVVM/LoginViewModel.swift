//
//  LoginViewModel.swift
//  RxLoginPageMVVM
//
//  Created by Yıldırımhan Atçıoğlu on 13.01.2019.
//  Copyright © 2019 Yıldırımhan Atçıoğlu. All rights reserved.
//

import Foundation
import RxSwift

protocol LoginViewModelProtocol {
    func loginButtonPressed()
}

struct LoginViewModel {
    var emailText = Variable<String>("")
    var passwordText = Variable<String>("")
    
    var isValid:Observable<Bool>{
        return Observable.combineLatest(emailText.asObservable(), passwordText.asObservable(), resultSelector: { email, password in
            return email.count >= 3 && password.count >= 3
        })
    }
}
