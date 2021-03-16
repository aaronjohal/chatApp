//
//  RegistrationController.swift
//  FireChat
//
//  Created by Aaron Johal on 11/03/2021.
//

import UIKit



class RegistrationController: UIViewController{
    
    //properties
    
    var signUpFormValidator = SignUpViewModel()
    private let plusPhotoBtn: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "plus_photo"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(handleSelectPhoto), for: .touchUpInside)
        button.clipsToBounds = true
        button.imageView?.clipsToBounds = true
        return button
        
        
    }()
    
    private lazy var emailContainer: InputContainerView = {
        return InputContainerView(image: #imageLiteral(resourceName: "ic_mail_outline_white_2x"), textField: emailTextField)
    }()
    
    private lazy var fullNameContainer: InputContainerView = {
        return InputContainerView(image: #imageLiteral(resourceName: "ic_person_outline_white_2x"), textField: fullNameTextField)
    }()
    
    private lazy var usernameContainer: InputContainerView = {
        return InputContainerView(image: #imageLiteral(resourceName: "ic_person_outline_white_2x"), textField: usernameTextField)
    }()
    
    private lazy var passwordContainer: InputContainerView = {
        return InputContainerView(image: #imageLiteral(resourceName: "ic_lock_outline_white_2x"), textField: passwordTextField)
    }()
    
    private let emailTextField = CustomTextField(placeHolder: "Email")
    private let fullNameTextField = CustomTextField(placeHolder: "Full Name")
    private let usernameTextField = CustomTextField(placeHolder: "Username")
    private let passwordTextField: UITextField = {
        let textField = CustomTextField(placeHolder: "Password")
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private let signUpButton: UIButton = {
        let button = CustomButton(placeholder: "Sign Up")
        button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        return button
    }()
    
    private let alreadyHaveAcc: UIButton = {
        let button = UIButton(type: .system)
        
        let attributedTitle = NSMutableAttributedString(string: "Already have an account?  ",
                                                        attributes: [.font: UIFont.systemFont(ofSize: 16),
                                                                     .foregroundColor: UIColor.white])
        attributedTitle.append (NSAttributedString(string: "Log In",
                                                   attributes: [.font: UIFont.boldSystemFont(ofSize: 16),
                                                                     .foregroundColor: UIColor.white]))
        
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.addTarget(self, action: #selector(handleLogIn), for: .touchUpInside)
        return button
    }()
    
    
    //lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
        configNotificationObservers()
    }
    
    //helpers
    
    
    func configUI(){
        
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black //makes the elements white (a bug)
        configGradientLayer()
        view.addSubview(plusPhotoBtn)
        
        plusPhotoBtn.centerX(inView: view)
        plusPhotoBtn.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
        plusPhotoBtn.setDimensions(height: 200, width: 200)
        
        
        let stackView = UIStackView(arrangedSubviews: [emailContainer, fullNameContainer, usernameContainer, passwordContainer, signUpButton])
        
        stackView.axis = .vertical
        stackView.spacing = 16
        
        view.addSubview(stackView)
        stackView.anchor(top: plusPhotoBtn.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 32, paddingLeft: 32,paddingRight: 32)
       
        
        view.addSubview(alreadyHaveAcc)
        alreadyHaveAcc.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingLeft: 32, paddingRight: 32)
        
      
        
    }
    //to notify when text has been inputted
    func configNotificationObservers(){
        
        emailTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        fullNameTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        usernameTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        
    }
    
    
    
  
    
    //Selectors
    @objc func handleSelectPhoto(){
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    @objc func handleSignUp(){
        print("signing up")
    }
    
    @objc func handleLogIn(){
        navigationController?.popViewController(animated: true) //takes us back to the previous screen
    }
    
    @objc func textDidChange(sender: UITextField){
        if sender == emailTextField {
            signUpFormValidator.email = sender.text
        } else if sender == passwordTextField {
            signUpFormValidator.password = sender.text
        } else if sender == fullNameTextField {
            signUpFormValidator.fullName = sender.text
        } else {
            signUpFormValidator.userName = sender.text
        }
        
        checkFormStatus()
        
        
    }
}



extension RegistrationController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info [.originalImage] as? UIImage
        plusPhotoBtn.setImage(image?.withRenderingMode(.alwaysOriginal), for: .normal)
        plusPhotoBtn.layer.borderColor = UIColor.white.cgColor
        plusPhotoBtn.layer.borderWidth = 3.0
        plusPhotoBtn.layer.cornerRadius = 200 / 2
        dismiss(animated: true, completion: nil)
    }
}

extension RegistrationController: AuthenticationControllerProtocol {
    
    func checkFormStatus(){
        if signUpFormValidator.formIsValid {
            signUpButton.isEnabled = true
            signUpButton.backgroundColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
        } else {
            signUpButton.isEnabled = false
            signUpButton.backgroundColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
            
        }
    }
    
}
