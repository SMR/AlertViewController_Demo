//
//  ViewController.swift
//  AlertViewController_Demo
//
//  Created by Nimble Chapps on 26/02/16.
//  Copyright © 2016 Nimble Chapps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func click_Alert(sender: AnyObject) {

        let alertController = UIAlertController(title: "Simple", message: "Simple alertView demo with Cancel and Ok.", preferredStyle: UIAlertControllerStyle.Alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel) { (result : UIAlertAction) -> Void in
            print("Cancel")
        }
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) { (result : UIAlertAction) -> Void in
            print("OK")
        }
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        self.presentViewController(alertController, animated: true, completion: nil)
    }

    @IBAction func click_Destructive(sender: AnyObject) {
        
        let alertController = UIAlertController(title: "Destructive", message: "Simple alertView demo with Destructive and Ok.", preferredStyle: UIAlertControllerStyle.Alert)
        let DestructiveAction = UIAlertAction(title: "Destructive", style: UIAlertActionStyle.Destructive) { (result : UIAlertAction) -> Void in
            print("Destructive")
        }
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) { (result : UIAlertAction) -> Void in
            print("OK")
        }
        alertController.addAction(DestructiveAction)
        alertController.addAction(okAction)
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    @IBAction func click_PlainTextAlertVeiw(sender: AnyObject) {
        
        let alertController = UIAlertController(title: "PlainTextStyle", message: "PlainTextStyle AlertView.", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addTextFieldWithConfigurationHandler { (textField : UITextField) -> Void in
            textField.placeholder = "Login"
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel) { (result : UIAlertAction) -> Void in
            print("Cancel")
        }
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) { (result : UIAlertAction) -> Void in
           print(alertController.textFields?.first?.text)
        }
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        self.presentViewController(alertController, animated: true, completion: nil)
        
    }
    
    @IBAction func click_SecureAlertView(sender: AnyObject) {
        
        let alertController = UIAlertController(title: "SecureStyle", message: "SecureStyle AlertView.", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addTextFieldWithConfigurationHandler { (textField : UITextField) -> Void in
            textField.secureTextEntry = true
            textField.placeholder = "Password"
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel) { (result : UIAlertAction) -> Void in
            print("Cancel")
        }
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) { (result : UIAlertAction) -> Void in
            print(alertController.textFields?.first?.text)
        }
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    @IBAction func click_LoginAlertView(sender: AnyObject) {
        
        let alertController = UIAlertController(title: "LoginStyle", message: "LoginStyle AlertView.", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addTextFieldWithConfigurationHandler { (textField : UITextField) -> Void in
            textField.placeholder = "Login"
            textField.addTarget(self, action: "alertTextFieldDidChange:", forControlEvents: UIControlEvents.EditingChanged)
        }
        alertController.addTextFieldWithConfigurationHandler { (textField : UITextField) -> Void in
            textField.secureTextEntry = true
            textField.placeholder = "Password"
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel) { (result : UIAlertAction) -> Void in
            print("Cancel")
        }
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) { (result : UIAlertAction) -> Void in
            print(alertController.textFields?.first?.text)
        }
        okAction.enabled = false
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    func alertTextFieldDidChange(sender : UITextField){
        
        let alertV = self.presentedViewController as? UIAlertController
        let login = (alertV!.textFields?.first)! as UITextField
        let okAction = alertV!.actions.last! as UIAlertAction
        okAction.enabled = login.text?.characters.count > 2
        
    }
}

