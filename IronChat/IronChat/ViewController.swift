//
//  ViewController.swift
//  IronChat
//
//  Created by don't touch me on 7/19/16.
//  Copyright © 2016 trvl, LLC. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let user = FIRAuth.auth()?.currentUser {
            print("am sighned in\(user)")
            
            self.signOutUser()
            
        } else {
            print("not sighned in")
        
            self.signInUser("j.sanchezrides@gmail.com", password: "123456")
        }
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        print(textField.text)
        
        if textField == self.userTextField {
            print(textField.text)
            
            textField.resignFirstResponder()
            
            self.passTextField.becomeFirstResponder()
            
            
        }
        
        return true
    }
    
    
    @IBAction func loginButtonTapped(sender: UIButton) {
        
        if let email = self.userTextField.text {
            
            if let password = self.passTextField.text {
                
                self.signInUser(email, password: password)
                
                self.performSegueWithIdentifier("LoginSegue", sender: nil)
            }
        }
        
    }
    
    @IBAction func registerButtonTapped(sender: UIButton) {
        
        self.performSegueWithIdentifier("RegisterSegue", sender: nil)
        
        
    }
        
    func signOutUser() {
            
            try! FIRAuth.auth()!.signOut()
            
        }

    func signInUser(email: String, password: String) {
        
        FIRAuth.auth()?.signInWithEmail(email, password: password) { (user, error) in
            
            if error != nil {
                print(error?.localizedDescription)
            }
            
            if let user = user {
                print("\(user.email) sighned in!")
            }
        }
    }

}

