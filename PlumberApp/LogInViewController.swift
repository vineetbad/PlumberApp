//
//  LogInViewController.swift
//  PlumberApp
//
//  Created by Vineet Baid on 13/02/18.
//  Copyright © 2018 Vineet Baid. All rights reserved.
//

import UIKit
import Alamofire

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
    
    func loginCheck(username: String, password: String){
        let currentURL = baseURL + "/AutenthicateUser"
        let parametersUser : Parameters = ["email" : username, "password" : password]
        Alamofire.request(currentURL, method: .get, parameters: parametersUser).responseJSON { (response) in
            print(response)
        }
        performSegue(withIdentifier: "LoginSegue", sender: nil)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        loginButtonLabel.layer.cornerRadius = 16.0
        rememberMe.isOn = false

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
