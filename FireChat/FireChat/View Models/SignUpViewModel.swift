//
//  SignUpViewModel.swift
//  FireChat
//
//  Created by Aaron Johal on 14/03/2021.
//

import Foundation

struct  SignUpViewModel: AuthenticationProtocol {
    var email: String?
    var password: String?
    var fullName: String?
    var userName: String?
    
    
    var formIsValid: Bool {
        return email?.isEmpty == false
            && password?.isEmpty == false
            && fullName?.isEmpty == false
            && userName?.isEmpty == false
    }
}
