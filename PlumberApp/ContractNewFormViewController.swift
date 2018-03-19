//
//  ContractNewFormViewController.swift
//  PlumberApp
//
//  Created by Vineet Baid on 14/02/18.
//  Copyright © 2018 Vineet Baid. All rights reserved.
//

import UIKit
import Eureka
import SwiftyJSON

class ContractNewFormViewController: FormViewController {
    //TODO: Save Function:
    //GlobalJSONValues.jsonGlobal[(tableView.indexPathForSelectedRow?.row)!].arrayObject?.remove(at: 0)
    //Might have to pass the number tableView.indexp... to a number here and do it from there. Let's see

    
    var currentDataJSON : JSON = [
 
        "state" : "",
        "features" : "",
        "ph_mobile" : "",
        "paid_by" : "",
        "IsActive" : JSON.null,
        "Collected" : "",
        "Dispatch_ID" : "",
        "ph_alternate" : "",
        "start_order_date" : JSON.null,
        "GateCode" : "",
        "Auth_Amount" : "",
        "Auth" : "",
        "service_fee" : "",
        "id" : JSON.null,
        "is_paid" : JSON.null,
        "zip" : JSON.null,
        "submit_signature" : JSON.null,
        "tenant_phone" : "",
        "brands" : "",
        "finish" : "",
        "tenant" : "",
        "fname" : "",
        "Invoice_Number" : "",
        "resolution" : "Resolution: ;",
        "Check" : "",
        "city" : "",
        "save_signature" : JSON.null,
        "email" : "",
        "ModifiedDate" : JSON.null,
        "note" : JSON.null,
        "address" : "",
        "description" : "Description: ",
        "disclaimer" : "",
        "sign_bool" : JSON.null,
        "order_date" : JSON.null,
        "service_type" : "ServiceType: ;ServiceType1:;ServiceType2:;ServiceType3:;ServiceType4:;",
        "total_due" : "",
        "customer_of" : "",
        "lname" : "",
        "diagnosis" : "Diagnosis:;",
        "tech" : "",
        "service_amount" : "Amount:;Amount1:;Amount2:;Amount3:;Amount4:;",
        "product" : "Location:;",
        "ph_primary" : ""
    ]
    

    var isNewContract = true
    
    @IBOutlet var signatureTextBox: UIButton!
    @IBAction func signaturePage(_ sender: Any) {
        
        if currentDataJSON["sign_bool"] == true {
            
            performSegue(withIdentifier: "LastSign", sender: self)
            
        }
        else {
            performSegue(withIdentifier: "FirstSign", sender: self)
        }
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
        
        
        
    }
    
 
    
    func checkIfBlankAndOthersTextRow(tagChosen: String,row: (TextRow)) {
        if currentDataJSON[row.tag!].exists() && currentDataJSON[row.tag!].string != ""{
            row.value = currentDataJSON[row.tag!].string
        }
        else {
            row.placeholder = tagChosen
            row.placeholderColor = UIColor.gray
        }
        row.onChange({ [unowned self] row in
            guard let updatedValue = row.value else {
                self.currentDataJSON[row.tag!].stringValue = ""
                print(self.currentDataJSON[row.tag!])
                
                return
            }
            self.currentDataJSON[row.tag!].stringValue = updatedValue
            print(self.currentDataJSON[row.tag!])
        })
        
        
        
    }
    
    
    func checkIfBlankAndOthersPushRow(tagChosen: String, row: (PushRow<String>)){
        if currentDataJSON[row.tag!].exists() && currentDataJSON[row.tag!].string != ""{
            row.value = currentDataJSON[row.tag!].string
            row.cell.detailTextLabel?.textColor = UIColor.black
        }
        else {
            row.noValueDisplayText = tagChosen
        }
        row.selectorTitle = "Pick One"
        row.onChange({ [unowned self] row in
            //self.checkIfBlankAndOthersPushRow(tagChosen: tagChosen, row: row)
            guard let updatedValue = row.value else {
                self.currentDataJSON[row.tag!].stringValue = ""
                print(self.currentDataJSON[row.tag!])

                return
            }
            self.currentDataJSON[row.tag!].stringValue = updatedValue
            print(self.currentDataJSON[row.tag!])
        })
        
    }
    
    func checkIfBlankAndOthersNameRow(tagChosen: String,row: (NameRow)) {
        if currentDataJSON[row.tag!].exists() && currentDataJSON[row.tag!].string != ""{
            row.value = currentDataJSON[row.tag!].string
        }
        else {
            row.placeholder = tagChosen
            row.placeholderColor = UIColor.gray
        }
        row.onChange({ [unowned self] row in
            guard let updatedValue = row.value else {
                self.currentDataJSON[row.tag!].stringValue = ""
                print(self.currentDataJSON[row.tag!])
                
                return
            }
            self.currentDataJSON[row.tag!].stringValue = updatedValue
            print(self.currentDataJSON[row.tag!])
        })
        
        
        
    }
    func checkIfBlankAndOthersPhoneRow(tagChosen: String,row: (PhoneRow)) {
        if currentDataJSON[row.tag!].exists() && currentDataJSON[row.tag!].string != ""{
            row.value = currentDataJSON[row.tag!].string
        }
        else {
            row.placeholder = tagChosen
            row.placeholderColor = UIColor.gray
        }
        row.onChange({ [unowned self] row in
            guard let updatedValue = row.value else {
                self.currentDataJSON[row.tag!].stringValue = ""
                print(self.currentDataJSON[row.tag!])
                
                return
            }
            self.currentDataJSON[row.tag!].stringValue = updatedValue
            print(self.currentDataJSON[row.tag!])
        })
       
        
        
    }
    
    func checkIfBlankStringToComponentText(row: TextRow, inputArray: [String]?, name: String, number: Int){
        
        if inputArray!.count > number{
            let inputArrayUnwrapped = (inputArray?[number])!
            if inputArrayUnwrapped == name+":" {
                row.placeholder = ""
                row.placeholder = name
                row.placeholderColor = UIColor.gray
                
            }
            else {
                let update = inputArrayUnwrapped.replacingOccurrences(of: name+":", with: "")
                row.value = update
                
            }
        }
        row.onChange({ [unowned self] row in
            guard let updatedValue = row.value else {
                self.currentDataJSON[row.tag!].stringValue = ""
                print(self.currentDataJSON[row.tag!])
                
                return
            }
            self.currentDataJSON[row.tag!].stringValue = updatedValue
            print(self.currentDataJSON[row.tag!])
        })
    }
    
    func checkIfBlankStringToComponentDecimal(row: DecimalRow, inputArray: [String]?, name: String, number: Int){
        
        if inputArray!.count > number{
            let inputArrayUnwrapped = (inputArray?[number])!
            if inputArrayUnwrapped == name+":" {
                row.placeholder = ""
                row.placeholder = name
                row.placeholderColor = UIColor.gray
                
            }
            else {
                let update = inputArrayUnwrapped.replacingOccurrences(of: name+":", with: "")
                row.value = Double(update)
                
            }
        }
        row.onChange({ [unowned self] row in
            guard let updatedValue = row.value else {
                self.currentDataJSON[row.tag!].stringValue = ""
                print(self.currentDataJSON[row.tag!])
                
                return
            }
            self.currentDataJSON[row.tag!].doubleValue = updatedValue
            print(self.currentDataJSON[row.tag!])
        })
    }
    
    
    func checkIfBlankStringToComponentPush(row: PushRow<String>, inputArray: [String]?, name: String, number: Int){
        
        if inputArray!.count > number{
            print(name)
            let inputArrayUnwrapped = (inputArray?[number])!
            //since pushrows are usually the first ones they're named as just the name, so we don't need number below (as we did above)
            if inputArrayUnwrapped == name+":" {
                //noValue instead of row.placeholder since this is a push row
                row.noValueDisplayText = name
                
            }
            else {
                let update = inputArrayUnwrapped.replacingOccurrences(of: name+":", with: "")
                row.value = update
                row.cell.detailTextLabel?.textColor = UIColor.black //have to do this cause or else it is grey
                
            }
        }
        row.onChange({ [unowned self] row in
            guard let updatedValue = row.value else {
                self.currentDataJSON[row.tag!].stringValue = ""
                print(self.currentDataJSON[row.tag!])
                
                return
            }
            self.currentDataJSON[row.tag!].stringValue = updatedValue
            print(self.currentDataJSON[row.tag!])
        })
    }
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        let descriptionString = currentDataJSON["description"].string
        let diagnosisString = currentDataJSON["diagnosis"].string
        let resolutionString = currentDataJSON["resolution"].string
        let descriptionComponents = descriptionString?.components(separatedBy: ";")
        let diagnosisComponents = diagnosisString?.components(separatedBy: ";")
        let resolutionComponents = resolutionString?.components(separatedBy: ";")
        let serviceString = currentDataJSON["service_type"].string
        let serviceComponents = serviceString?.components(separatedBy: ";")
        let amountString = currentDataJSON["service_amount"].string
        let amountComponents = amountString?.components(separatedBy: ";")
        let fixtureTypeakaFeatureString = currentDataJSON["features"].string
        let fixtureTypeakaFeatureComponents = fixtureTypeakaFeatureString?.components(separatedBy: ";")
        let finishString = currentDataJSON["finish"].string
        let finishComponents = finishString?.components(separatedBy: ";")
        let brandsString = currentDataJSON["brands"].string
        let brandsComponents = brandsString?.components(separatedBy: ";")
        let locationakaProductString = currentDataJSON["product"].string
        let locationakaProductComponents = locationakaProductString?.components(separatedBy: ";")

        


        navigationItem.title = "New Job"
        navigationController?.navigationBar.prefersLargeTitles = false

        
        form = Section("SECTIONS:")
            <<< SegmentedRow<String>("option"){
                $0.options = ["Main", "Specs", "Service", "Products"]
                $0.value = "Main"
            }
            
            
            
            +++ Section("Customer Contact Information"){
                $0.tag = "customer"
                $0.hidden = "$option != 'Main'"
            }
            
            
            <<< PushRow<String>() {row in
                row.tag = "customer_of"
                row.title = "CUSTOMER OF:"
                row.options = ["AHS", "NON-AHS"]
                let tagHere = "Customer Type"
                checkIfBlankAndOthersPushRow(tagChosen: tagHere, row: row)
                row.selectorTitle = "Pick One"
                
            }
            

            <<< TextRow(){row in
                row.tag = "Dispatch_ID"
                checkIfBlankAndOthersTextRow(tagChosen: "Dispatch Id", row: row)
                row.title = "DISPATCH ID:"
        }
            <<< TextRow(){row in
                row.tag = "GateCode"
                row.title = "GATE CODE:"
                checkIfBlankAndOthersTextRow(tagChosen: "Gate Code", row: row)
            }
            <<< PushRow<String>() {row in
                row.tag = "tech"
                row.title = "PLUMBER:"
                row.options = ["Vik Baid", "Aladdin", "Liz Alagiannis", "Stephen Young", "Bhakti Gabbard", "Emily Montoya", "Jack Nagase", "Dylan Ogle", "Taylor Cunningham", "Vik Baid2"]
                checkIfBlankAndOthersPushRow(tagChosen: "Plumber Name",row: row)
                row.selectorTitle = "Choose a Plumber"
                
            }
            

            <<< NameRow(){row in
                row.tag = "fname"
                row.title = "FIRST NAME:"
                checkIfBlankAndOthersNameRow(tagChosen: "First Name", row: row)

        }
            <<< NameRow(){row in
                row.tag = "lname"
                row.title = "LAST NAME:"
                checkIfBlankAndOthersNameRow(tagChosen: "Last Name", row: row)
                
            }
            
            <<< TextRow(){row in
                row.tag = "address"
                row.title = "ADDRESS:"
                checkIfBlankAndOthersTextRow(tagChosen: "Address", row: row)
            }
            <<< TextRow(){row in
                row.tag = "city"
                row.title = "CITY:"
                checkIfBlankAndOthersTextRow(tagChosen: "City", row: row)
        }
            
            <<< TextRow(){row in
                row.tag = "state"
                row.title = "STATE:"
                checkIfBlankAndOthersTextRow(tagChosen: "State", row: row)
            }
            <<< ZipCodeRow(){row in
                row.tag = "zip"
                row.title = "ZIP:"
                if currentDataJSON[row.tag!].exists() && currentDataJSON[row.tag!].string != ""{
                    row.value = currentDataJSON[row.tag!].string
                }
                else {
                    row.placeholder = "Zip"
                    row.placeholderColor = UIColor.gray
                }
                row.onChange({ [unowned self] row in
                    guard let updatedValue = row.value else {
                        self.currentDataJSON[row.tag!].stringValue = ""
                        print(self.currentDataJSON[row.tag!])
                        
                        return
                    }
                    self.currentDataJSON[row.tag!].stringValue = String(updatedValue)
                    print(self.currentDataJSON[row.tag!])
                })
                //TODO: Find a way to convert to Int
                
            }
            <<< PhoneRow(){row in
                row.tag = "ph_primary"
                row.title = "PHONE:"
                checkIfBlankAndOthersPhoneRow(tagChosen: "Phone (primary)", row: row)
            }
            
            <<< PhoneRow(){row in
                row.tag = "ph_alternate"
                row.title = "PHONE:"
                checkIfBlankAndOthersPhoneRow(tagChosen: "Phone (secondary)", row: row)
                
            }
            <<< PhoneRow(){row in
                row.tag = "ph_mobile"
                row.title = "MOBILE:"
                checkIfBlankAndOthersPhoneRow(tagChosen: "Mobile", row: row)
            }
            
            <<< EmailRow(){row in
                row.tag = "email"
                row.title = "EMAIL:"
                if currentDataJSON[row.tag!].exists() && currentDataJSON[row.tag!].string != ""{
                    row.value = currentDataJSON[row.tag!].string
                }
                else {
                    row.placeholder = "Email ID"
                    row.placeholderColor = UIColor.gray
                }
                
                row.onChange({ [unowned self] row in
                    guard let updatedValue = row.value else {
                        self.currentDataJSON[row.tag!].stringValue = ""
                        print(self.currentDataJSON[row.tag!])
                        
                        return
                    }
                    self.currentDataJSON[row.tag!].stringValue = updatedValue
                    print(self.currentDataJSON[row.tag!])
                })
            }
            <<< TextRow(){row in
                row.tag = "tenant"
                row.title = "TENANT:"
                checkIfBlankAndOthersTextRow(tagChosen: "Tenant", row: row)
            }
            <<< PhoneRow(){row in
                row.tag = "tenant_phone"
                row.title = "TENANT PHONE:"
                checkIfBlankAndOthersPhoneRow(tagChosen: "Tenant Phone", row: row)
                
        }
        form +++ Section("Specifications"){
            $0.tag = "specs"
            $0.hidden = "$option != 'Specs'"
            }
            
            
            //TODO: The Description and stuff don't work for pulling
            //
            //
            //

            <<< PushRow<String>() {row in
                row.tag = "description" //TODO: This needs to be fixed (same with all below)
                row.title = "DESCRIPTION:"
                row.options = ["Test 2", "Leaking Toilet"]
                row.selectorTitle = "Choose one"
                checkIfBlankStringToComponentPush(row: row, inputArray: descriptionComponents, name: "Description", number: 0)

                }
            
            <<< PushRow<String>() {row in
                row.tag = "diagnosis"
                row.title = "DIAGNOSIS:"
                row.options = ["Malfunctioning Flush Valve Seal"]
                row.selectorTitle = "Choose one"
                checkIfBlankStringToComponentPush(row: row, inputArray: diagnosisComponents, name: "Diagnosis", number: 0)
            }
            
            <<< PushRow<String>() {row in
                row.tag = "resolution"
                row.title = "RESOLUTION:"
                row.options = ["Replaced Flush Valve Gasket"]
                row.selectorTitle = "Choose one"
                checkIfBlankStringToComponentPush(row: row, inputArray: resolutionComponents, name: "Resolution", number: 0)
            }
            <<< LabelRow(){row in
                row.cell.backgroundColor = UIColor.clear
                
            }

            <<< TextRow(){row in
                row.tag = "description[1]"
                row.title = "DESCRIPTION 1:"
                checkIfBlankStringToComponentText(row: row, inputArray: descriptionComponents, name: "Description1", number: 1)
                
                
            }
            
            <<< TextRow(){row in
                row.tag = "diagnosis[1]"
                row.title = "DIAGNOSIS 1:"
                checkIfBlankStringToComponentText(row: row, inputArray: diagnosisComponents, name: "Diagnosis1", number: 1)
            }
            <<< TextRow(){row in
                row.tag = "resolution[1]"
                row.title = "RESOLUTION 1:"
                checkIfBlankStringToComponentText(row: row, inputArray: resolutionComponents, name: "Resolution1", number: 1)
            }
            <<< LabelRow(){row in
                row.cell.backgroundColor = UIColor.clear
                
            }
            <<< TextRow(){row in
                row.tag = "description[2]"
                row.title = "DESCRIPTION 2:"
                checkIfBlankStringToComponentText(row: row, inputArray: descriptionComponents, name: "Description2", number: 2)

            }
            
            <<< TextRow(){row in
                row.tag = "diagnosis[2]"
                row.title = "DIAGNOSIS 2:"
                checkIfBlankStringToComponentText(row: row, inputArray: diagnosisComponents, name: "Diagnosis2", number: 2)
            }
            <<< TextRow(){row in
                row.tag = "resolution[2]"
                row.title = "RESOLUTION 2:"
                checkIfBlankStringToComponentText(row: row, inputArray: resolutionComponents, name: "Resolution2", number: 2)
            }
            <<< LabelRow(){row in
                row.cell.backgroundColor = UIColor.clear
                
        }
            <<< TextRow(){row in
                row.tag = "description[3]"
                row.title = "DESCRIPTION 3:"
                checkIfBlankStringToComponentText(row: row, inputArray: descriptionComponents, name: "Description3", number: 3)
            }
            
            <<< TextRow(){row in
                row.tag = "diagnosis[3]"
                row.title = "DIAGNOSIS 3:"
                checkIfBlankStringToComponentText(row: row, inputArray: diagnosisComponents, name: "Diagnosis3", number: 3)
            }
            <<< TextRow(){row in
                row.tag = "resolution[3]"
                row.title = "RESOLUTION 3:"
                checkIfBlankStringToComponentText(row: row, inputArray: resolutionComponents, name: "Resolution3", number: 3)
            }
            <<< LabelRow(){row in
                row.cell.backgroundColor = UIColor.clear
                
        }
        
        form +++ Section("Service & Payment"){
            $0.tag = "service"
            $0.hidden = "$option != 'Service'"
            }
            
            <<< PushRow<String>() {row in
                row.tag = "service_type"
                row.title = "SERVICE:"
                row.options = ["General Service"]
                row.selectorTitle = "Choose one"
                checkIfBlankStringToComponentPush(row: row, inputArray: serviceComponents, name: "ServiceType", number: 0)
            }
            
            //HAVE TO CHANGE
            <<< DecimalRow() {row in
                row.tag = "service_amount"
                row.title = "AMOUNT:"
                row.formatter = DecimalFormatter()
                row.useFormatterDuringInput = true
                
                checkIfBlankStringToComponentDecimal(row: row, inputArray: amountComponents, name: "Amount", number: 0)
                
                }.cellSetup { cell, _  in
                    cell.textField.keyboardType = .numberPad
            }
            <<< LabelRow(){row in
                row.cell.backgroundColor = UIColor.clear
                
            }

            <<< TextRow(){row in
                row.tag = "service_type 1"
                row.title = "SERVICE 1:"
                checkIfBlankStringToComponentText(row: row, inputArray: serviceComponents, name: "ServiceType1", number: 1)
                
            }
            <<< DecimalRow() {row in
                row.tag = "service_amount 1"
                row.title = "AMOUNT 1:"
                row.formatter = DecimalFormatter()
                row.useFormatterDuringInput = true
                
                checkIfBlankStringToComponentDecimal(row: row, inputArray: amountComponents, name: "Amount1", number: 1)
                
                }.cellSetup { cell, _  in
                    cell.textField.keyboardType = .numberPad
            }
            <<< LabelRow(){row in
                row.cell.backgroundColor = UIColor.clear
                
            }
            
            <<< TextRow(){row in
                row.tag = "service_type 2"
                row.title = "SERVICE 2:"
                checkIfBlankStringToComponentText(row: row, inputArray: serviceComponents, name: "ServiceType2", number: 2)
                
            }
            <<< DecimalRow() {row in
                row.tag = "service_amount 2"
                row.title = "AMOUNT 2:"
                row.formatter = DecimalFormatter()
                row.useFormatterDuringInput = true
                
                checkIfBlankStringToComponentDecimal(row: row, inputArray: amountComponents, name: "Amount2", number: 2)
                
                }.cellSetup { cell, _  in
                    cell.textField.keyboardType = .numberPad
            }
            <<< LabelRow(){row in
                row.cell.backgroundColor = UIColor.clear
                
            }
            <<< TextRow(){row in
                row.tag = "service_type 3"
                row.title = "SERVICE 3:"
                checkIfBlankStringToComponentText(row: row, inputArray: serviceComponents, name: "ServiceType3", number: 3)
                
            }
            <<< DecimalRow() {row in
                row.tag = "service_amount 3"
                row.title = "AMOUNT 3:"
                row.formatter = DecimalFormatter()
                row.useFormatterDuringInput = true
                
                checkIfBlankStringToComponentDecimal(row: row, inputArray: amountComponents, name: "Amount3", number: 3)
                
                }.cellSetup { cell, _  in
                    cell.textField.keyboardType = .numberPad
            }
            <<< LabelRow(){row in
                row.cell.backgroundColor = UIColor.clear
                
        }
        form +++ Section("Products & Parts"){
            $0.tag = "products"
            $0.hidden = "$option != 'Products'"
            }
            
            <<< PushRow<String>() {row in
                row.tag = "location"
                row.title = "LOCATION:"
                row.options = ["Kitchen", "Master Bath", "Guest Bath", "Powder Room", "Garage", "Other"]
                row.selectorTitle = "Choose one"
                checkIfBlankStringToComponentPush(row: row, inputArray: locationakaProductComponents, name: "Location", number: 0)
            }
            
            <<< PushRow<String>() {row in
                row.tag = "brands"
                row.title = "BRANDS:"
                row.options = ["Moen", "Price Pfister", "Kohler", "Delta", "Grohe", "Other"]
                row.selectorTitle = "Choose one"
                checkIfBlankStringToComponentPush(row: row, inputArray: brandsComponents, name: "Brands", number: 0)
            }
            
            <<< PushRow<String>() {row in
                row.tag = "fixture type"
                row.title = "FIXTURE TYPE:"
                row.options = ["Bathroom Faucet Widespread", "Toilet", "Kithchen Faucet", "Bathroom Faucet Center Set", "Tub Shower", "Shower Only", "Tub Only", "Laundry Valve", "Lab Sink", "Water Heater", "Other"]
                row.selectorTitle = "Choose one"
                checkIfBlankStringToComponentPush(row: row, inputArray: fixtureTypeakaFeatureComponents, name: "Fixture", number: 0)
            }
            
            <<< PushRow<String>() {row in
                row.tag = "finish"
                row.title = "FINISH/COLOR:"
                row.options = ["Chrome", "Brush Nickel", "Oil-Rubbed Bronze"]
                row.selectorTitle = "Choose one"
                checkIfBlankStringToComponentPush(row: row, inputArray: finishComponents, name: "FinishColor", number: 0)
            }
            
            <<< LabelRow(){row in
                row.cell.backgroundColor = UIColor.clear
                
            }
            
            <<< TextRow(){row in
                row.tag = "location1"
                row.title = "LOCATION 1:"
                checkIfBlankStringToComponentText(row: row, inputArray: locationakaProductComponents, name: "Location1", number: 1)
        }
            <<< TextRow(){row in
                row.tag = "brands1"
                row.title = "BRANDS 1:"
                checkIfBlankStringToComponentText(row: row, inputArray: brandsComponents, name: "Brands1", number: 1)

        }
            <<< TextRow(){row in
                row.tag = "fixture1"
                row.title = "FIXTURE TYPE 1:"
                checkIfBlankStringToComponentText(row: row, inputArray: fixtureTypeakaFeatureComponents, name: "Fixture1", number: 1)
        }
            <<< TextRow(){row in
                row.tag = "finish1"
                row.title = "FINISH/COLOR 1:"
                checkIfBlankStringToComponentText(row: row, inputArray: finishComponents, name: "FinishColor1", number: 1)
        }
            <<< LabelRow(){row in
                row.cell.backgroundColor = UIColor.clear
                
            } <<< TextRow(){row in
                row.tag = "location2"
                row.title = "LOCATION 2:"
                checkIfBlankStringToComponentText(row: row, inputArray: locationakaProductComponents, name: "Location2", number: 2)
            }
            <<< TextRow(){row in
                row.tag = "brands2"
                row.title = "BRANDS 2:"
                checkIfBlankStringToComponentText(row: row, inputArray: brandsComponents, name: "Brands2", number: 2)
                
            }
            <<< TextRow(){row in
                row.tag = "fixture2"
                row.title = "FIXTURE TYPE 2:"
                checkIfBlankStringToComponentText(row: row, inputArray: fixtureTypeakaFeatureComponents, name: "Fixture2", number: 2)
            }
            <<< TextRow(){row in
                row.tag = "finish2"
                row.title = "FINISH/COLOR 2:"
                checkIfBlankStringToComponentText(row: row, inputArray: finishComponents, name: "FinishColor2", number: 2)
            }
            <<< LabelRow(){row in
                row.cell.backgroundColor = UIColor.clear
                
        }
            <<< TextRow(){row in
                row.tag = "location3"
                row.title = "LOCATION 3:"
                checkIfBlankStringToComponentText(row: row, inputArray: locationakaProductComponents, name: "Location3", number: 3)
            }
            <<< TextRow(){row in
                row.tag = "brands3"
                row.title = "BRANDS 3:"
                checkIfBlankStringToComponentText(row: row, inputArray: brandsComponents, name: "Brands3", number: 3)
                
            }
            <<< TextRow(){row in
                row.tag = "fixture3"
                row.title = "FIXTURE TYPE 3:"
                checkIfBlankStringToComponentText(row: row, inputArray: fixtureTypeakaFeatureComponents, name: "Fixture3", number: 3)
            }
            <<< TextRow(){row in
                row.tag = "finish3"
                row.title = "FINISH/COLOR 3:"
                checkIfBlankStringToComponentText(row: row, inputArray: finishComponents, name: "FinishColor3", number: 3)
            }
            <<< LabelRow(){row in
                row.cell.backgroundColor = UIColor.clear
                
        }

        
        
        
        

        tableView.tableFooterView = UIView()


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}
