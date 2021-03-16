//
//  LoginViewModel.swift
//  FireChat
//
//  Created by Aaron Johal on 14/03/2021.
//

import Foundation

protocol AuthenticationProtocol {
    var formIsValid: Bool {get}
}



struct LoginViewModel: AuthenticationProtocol {
    
    
    
    var email: String?
    var password: String?
    
    var formIsValid: Bool {
        return email?.isEmpty == false && password?.isEmpty == false //if components are not empty, it will return true
    }
    
    

    
    
    }
    

