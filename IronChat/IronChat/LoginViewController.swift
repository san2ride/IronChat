//
//  LoginViewController.swift
//  IronChat
//
//  Created by don't touch me on 7/19/16.
//  Copyright © 2016 trvl, LLC. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController, UITextFieldDelegate {
        
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.signOutUser()
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
    
    @IBAction func signOutButtonTapped(sender: UIButton) {
        
        
    }
    
    func deniedAlert() {
        let alert = UIAlertController(title: "Invalid Login", message: "", preferredStyle: .Alert)
        
            let cancelAction = UIAlertAction(title: "Denied",
                                             style: .Default) {
                                                (action) in
        }
        alert.addAction(cancelAction)
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
        
    func signOutUser() {
            
            try! FIRAuth.auth()!.signOut()
            
        }

    func signInUser(email: String, password: String) {
        
        FIRAuth.auth()?.signInWithEmail(email, password: password) { (user, error) in
            
            if error != nil {
                print(error?.localizedDescription)
                
                self.deniedAlert()
            }
            
            if let user = user {
                print("\(user.email) sighned in!")
            }
        }
    }

}

