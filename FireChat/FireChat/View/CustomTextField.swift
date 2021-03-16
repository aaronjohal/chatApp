//
//  CustomTextField.swift
//  FireChat
//
//  Created by Aaron Johal on 11/03/2021.
//

import UIKit

class CustomTextField: UITextField, UITextFieldDelegate{
    
    init(placeHolder: String) {
        super.init(frame: .zero)
        
        borderStyle = .none
        font = UIFont.systemFont(ofSize: 16)
        textColor = .white
        keyboardAppearance = .dark //dark keyboard
        attributedPlaceholder = NSAttributedString(string: placeHolder, attributes: [.foregroundColor: UIColor.white]) //custom placeholder
        
        
     
        delegate = self

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        endEditing(true)
        return false
    }
    
   
    

}

