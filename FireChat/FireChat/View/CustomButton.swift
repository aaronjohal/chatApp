//
//  CustomButton.swift
//  FireChat
//
//  Created by Aaron Johal on 13/03/2021.
//

import UIKit 

class CustomButton: UIButton{
    
    init(placeholder: String) {
        super.init(frame: .zero)
        
        setTitle(placeholder, for: .normal)
        layer.cornerRadius = 5
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
       backgroundColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        setTitleColor(.white, for: .normal)
        setHeight(height: 50)
      
        isEnabled = false

        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
