//
//  LogInViewController.swift
//  PlumberApp
//
//  Created by Vineet Baid on 13/02/18.
//  Copyright © 2018 Vineet Baid. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class LogInViewController: UIViewController {
    
    let baseURL : String = "http://108.80.86.132:90/api/Contact"
    

    
    //Outlets
    @IBOutlet var loginButtonLabel: UIButton!
    @IBOutlet var rememberMe: UISwitch!

    @IBOutlet var logoImage: UIImageView!
    @IBOutlet var passwordLabel: UITextField!
    @IBOutlet var usernameLabel: UITextField!
    @IBAction func loginAction(_ sender: Any) {
        
        let usernameCheck = usernameLabel.text
        let passwordCheck = passwordLabel.text
        
        loginCheck(username: usernameCheck!, password: passwordCheck!)
        
        
        //check if it is ok or not
    }
    
    @IBAction func forgotPassword(_ sender: Any) {
        //send something
        
    }
    
    
    //Log Out from next page thing:
    @IBAction func logOut(_ sender: UIStoryboardSegue){
        navigationController?.navigationBar.isHidden = true

        print("done")
    }
    func loginCheck(username: String, password: String){
        let currentURL = baseURL + "/AutenthicateUser"
        let parametersUser : Parameters = ["email" : username, "password" : password]
        Alamofire.request(currentURL, method: .get, parameters: parametersUser).responseJSON { (response) in
            if response.result.isFailure{
                self.alertFunc(message: "Could not connect to the Internet")
            }
            else {
                
                
                let loginJSON : JSON = JSON(response.result.value!)
                if loginJSON["message"].stringValue == "Successful"{
                    print(loginJSON)
                    self.performSegue(withIdentifier: "LoginSegue", sender: self)
                }
                else {
                    self.alertFunc(message: loginJSON["message"].stringValue)
                }
            }
        }
        
    }
    
    func alertFunc(message: String){
        
        let alert = UIAlertController(title: "Please Try Again", message: message, preferredStyle: .alert)
        let actionBack = UIAlertAction(title: "Try Again", style: .cancel) { (action) in
                //print("test")
            }
        alert.addAction(actionBack)
        present(alert, animated: true, completion: nil)
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        
        loginButtonLabel.layer.cornerRadius = 16.0
        rememberMe.isOn = false

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "LoginSegue" {
            guard let pendingVC = segue.destination as? PendingContractsTableViewController else {return}
            pendingVC.contractWork = ["""
Contract 1
Contract 1 Date
Contract 1 Customer
"""]
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    


}
