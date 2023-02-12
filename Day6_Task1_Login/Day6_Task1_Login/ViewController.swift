//
//  ViewController.swift
//  Day6
//
//  Created by ITI on 2/9/23.
//  Copyright © 2023 ITI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var UserName: UITextField!
    @IBOutlet weak var PassWord: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func SignUp(_ sender: Any) {
        
        let name:  String = (UserName.text!)
        let pass: String = (PassWord.text!)
        let UserDef : UserDefaults = UserDefaults.standard
        UserDef.set(name, forKey:"Name")
        UserDef.set(pass, forKey:"Password")
        UserDef.synchronize()
        UserName.text=""
        PassWord.text=""
        
    }
    
    @IBAction func SignIn(_ sender: Any) {
        let UserDef:UserDefaults=UserDefaults.standard
        let name:String = UserDef.value(forKey: "Name") as! String
        let pass:String = UserDef.value(forKey: "Password") as! String
        if (name==UserName.text && pass==PassWord.text){
            let MyAlert :UIAlertController=UIAlertController(title: "Welcome", message: "You have been signed in succssesfully", preferredStyle: UIAlertController.Style.alert)
            let ok :UIAlertAction=UIAlertAction(title: "Ok", style: UIAlertAction.Style.default){
                (action:UIAlertAction) in
                print("Ok Action")
            }
            MyAlert.addAction(ok)
            self.present(MyAlert, animated: true, completion: nil)
            UserName.text=""
            PassWord.text=""
        }
        else{
            let MyAlert :UIAlertController=UIAlertController(title: "...Oops", message: "The username and password doesnt match in our database, please try again.", preferredStyle: UIAlertController.Style.alert)
            let tryAgain :UIAlertAction=UIAlertAction(title: "Try agian", style: UIAlertAction.Style.default){
                (action:UIAlertAction) in print("Tryagain Action")
            }
                let CancleAction :UIAlertAction=UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default){
                (action:UIAlertAction) in print("Cancel Action")
            }
            MyAlert.addAction(tryAgain)
            MyAlert.addAction(CancleAction)
                self.present(MyAlert, animated: true, completion: nil)
            UserName.text=""
            PassWord.text=""
        }
    }
}

