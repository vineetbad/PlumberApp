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
    
    let baseURL : String = "http://ec2-18-217-91-105.us-east-2.compute.amazonaws.com:93/api"
    
    
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
        //TODO: Post all the GlobalJSONValue to the database and also make it null again

        print("done")
    }
    func loginCheck(username: String, password: String){
        let currentURL = baseURL + "/order_form/Get_Assigned_Task/"
        let parametersUser : Parameters = ["username" : username, "password" : password]
        Alamofire.request(currentURL, method: .get, parameters: parametersUser).responseData { (response) in
            if response.result.isFailure{
                self.alertFunc(message: "Could not connect to the Internet")
            }
            else{
                let valueReturn = String(data : response.result.value!, encoding : String.Encoding.utf8)
                let JSONReturn = JSON.init(parseJSON: valueReturn!)
                //ASK VIK FOR THE MESSAGE API in this. Doesn't look like we have one. This helps if there is no login. I can default to username or password is not working
                print(JSONReturn["message"])


                //if everything is good then go here:
                GlobalJSONValues.jsonGlobal = JSONReturn
                self.performSegue(withIdentifier: "LoginSegue", sender: self)

            }
        }
        //{ (response) in
        //          //MARK: IF THERE IS A message in the response value then need to have that here so that an alert function can be thrown
//            else {
//
//
//                let loginJSON : JSON = JSON(response.result.value!)
//                if loginJSON["message"].stringValue == "Successful"{
//                    print(loginJSON)
//                    self.performSegue(withIdentifier: "LoginSegue", sender: self)
//                }
//                else {
//                    self.alertFunc(message: loginJSON["message"].stringValue)
//                }
//            }
//        }
        
    }
    
    func alertFunc(message: String){
        
        let alert = UIAlertController(title: "Please Try Again", message: message, preferredStyle: .alert)
        let actionBack = UIAlertAction(title: "Try Again", style: .cancel) { (action) in
            }
        alert.addAction(actionBack)
        present(alert, animated: true, completion: nil)
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        
        loginButtonLabel.layer.cornerRadius = 16.0
        rememberMe.isOn = false

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    


}

struct GlobalJSONValues {
    static var jsonGlobal : JSON = JSON.null
}
