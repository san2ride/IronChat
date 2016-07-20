//
//  RegisterViewController.swift
//  IronChat
//
//  Created by don't touch me on 7/19/16.
//  Copyright © 2016 trvl, LLC. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var emailRegisterField: UITextField!
    @IBOutlet weak var passRegisterField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        


        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        print(textField)
        
        if textField == self.emailRegisterField {
            print(textField.text)
            
            textField.resignFirstResponder()
            
            self.passRegisterField.becomeFirstResponder()
            
        }
        return true
    }
    
    @IBAction func registerButtonTapped(sender: AnyObject) {
        
        if let email = self.emailRegisterField.text {
            
            if let password = self.passRegisterField.text {
                
                self.createUser(email, password: password)
            }
        }
    }

    func createUser(email: String, password: String) {
        FIRAuth.auth()?.createUserWithEmail(email, password: password) {
            
            (user, error) in
            
            if error != nil {
                print(error?.localizedDescription)
            }
            
            if let user = user {
                print(user.uid)
                print("success! create")
            }
        }
    }
}