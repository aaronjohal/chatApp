//
//  LoginController.swift
//  FireChat
//
//  Created by Aaron Johal on 11/03/2021.
//

import UIKit


protocol AuthenticationControllerProtocol {
    func checkFormStatus()
}

class LoginController: UIViewController{

    
    //properties
    
    private var loginFormValidator = LoginViewModel() //to authenticate textfields not empty
    
    private let iconImage: UIImageView = { //creating UI elements programatically
        let imageV = UIImageView()
        imageV.image = UIImage(systemName: "bubble.right")
        imageV.tintColor = .white
        return imageV
        
        //programaticlaly - name the variable, caste it. Make a property of the type, return it with constructor
    }()
    
    
    //lazy -> wont load property until its time for it to happen..allows us to show emailTextField once its created in the subview
    private lazy var emailContainerView: UIView = {
        //image: UIImage(systemName: "envelope") or image literal
        return InputContainerView(image: #imageLiteral(resourceName: "ic_mail_outline_white_2x"), textField: emailTextField)
        
    }()
    
    private lazy var passwordContainerView: InputContainerView = {
       
        return InputContainerView(image: #imageLiteral(resourceName: "ic_lock_outline_white_2x"), textField: passwordTextField)
        
    }()
    
    private let loginBtn: UIButton = {
        let btn = CustomButton(placeholder: "Logged in")
        
        btn.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        return btn
    }()
    
    private let signUpBtn: UIButton = {
        let button = UIButton(type: .system)
        
        let attributedTitle = NSMutableAttributedString(string: "Don't have an account?  ",
                                                        attributes: [.font: UIFont.systemFont(ofSize: 16),
                                                                     .foregroundColor: UIColor.white])
        attributedTitle.append (NSAttributedString(string: "Sign Up",
                                                   attributes: [.font: UIFont.boldSystemFont(ofSize: 16),
                                                                     .foregroundColor: UIColor.white]))
        
        button.setAttributedTitle(attributedTitle, for: .normal)
        
        return button
    }()
    //lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
      
    }
    
    private let emailTextField = CustomTextField(placeHolder: "Email")
    
    private let passwordTextField: UITextField = {
         let pwdTxtField = CustomTextField(placeHolder: "Password")
        pwdTxtField.isSecureTextEntry = true
        return pwdTxtField
        
    }()
    
    
    
    
    
    //helpers
    
    
    func configUI(){
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black //makes the elements white (a bug)
       configGradientLayer()
        
        view.addSubview(iconImage)
        
        //manuallySetContraintsOnEveryObject()
        
        iconImage.centerX(inView: view) //centres icon image in the current view
        iconImage.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32) //anchor to the top
        iconImage.setDimensions(height: 120, width: 120)
        
        
        //creating stackview
        
        let stack = UIStackView(arrangedSubviews: [emailContainerView,passwordContainerView, loginBtn]) //creating a stackview
        stack.axis = .vertical
        stack.spacing = 16
        
        view.addSubview(stack)
        stack.anchor(top: iconImage.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 32, paddingLeft: 32, paddingRight: 32)
        
        
        view.addSubview(signUpBtn)
        signUpBtn.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingLeft: 32, paddingRight: 32)
        
        signUpBtn.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        
        
        emailTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        
    }
    
    @objc func textDidChange(sender: UITextField){//the snder for the selector is a texdfield e.g. emailTextField
        if sender == emailTextField {
            loginFormValidator.email = sender.text
        } else {
            loginFormValidator.password = sender.text
        }
        print(emailTextField)
        print(passwordTextField)
        
        checkFormStatus()
    }
    
    @objc func handleSignUp(){
        let controller = RegistrationController()
        navigationController?.pushViewController(controller, animated: true) //display the next view controller 
    }
    
    @objc func handleLogin(){
        print("new page")
    }
    
    //just an example but we are using extentions instead
    func manuallySetContraintsOnEveryObject(){
        
        //image contstraints
        
        //active autolayout programatically
        iconImage.translatesAutoresizingMaskIntoConstraints = false
        
        //set constraints
        iconImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        iconImage.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        //set image size
        iconImage.heightAnchor.constraint(equalToConstant: 120).isActive = true
        iconImage.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
    }
    
    
    
 
}

extension LoginController: AuthenticationControllerProtocol {
    
    func checkFormStatus(){
        if loginFormValidator.formIsValid {
            loginBtn.isEnabled = true
            loginBtn.backgroundColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
        } else {
            loginBtn.isEnabled = false
            loginBtn.backgroundColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
            
        }
    }
    
}
