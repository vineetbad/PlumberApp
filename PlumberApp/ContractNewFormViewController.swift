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
        "features" : "Features:Bathroom Faucet Widespread;",
        "paid_by" : "check",
        "IsActive" : JSON.null,
        "Collected" : "yes",
        "start_order_date" : JSON.null,
        "Auth_Amount" : "5000",
        "Auth" : "124996",
        "service_fee" : "5000",
        "id" : 1648,
        "is_paid" : JSON.null,
        "submit_signature" : JSON.null,
        "brands" : "Brands:Price Pfister ;",
        "finish" : "Finish:Chrome;",
        "Invoice_Number" : "801648",
        "resolution" : "Resolution:Snaked sink to remove clog ;",
        "Check" : "5345345",
        "save_signature" : JSON.null,
        "ModifiedDate" : JSON.null,
        "note" : JSON.null,
        "description" : "Description:Master bathroom sink is clogged;",
        "disclaimer" : "Aladdin’s Plumbing is not responsible for damage to clay, orangeberg or improperly installed lines or pre-existing conditions.,The law requires that AP gives you a notice explaining your right to cancel for any work performed that is paid for. Please initial If Aladdin’s Plumbing has given you a notice of the ‘3 Day Right to Cancel”. This contractor caries commercial general liability insurance written by Farmers Insurance. You may call 831.688.8664 to check coverage.",
        "sign_bool" : JSON.null,
        "order_date" : JSON.null,
        "service_type" : "ServiceType:service type1;ServiceType1:service type 2;ServiceType2:service type 3;ServiceType3:service type 4;ServiceType4:;ServiceType5:;ServiceType6:;ServiceType7:;ServiceType8:;ServiceType9:;",
        "total_due" : "90",
        "customer_of" : "NON-AHS",
        "diagnosis" : "Diagnosis:Hair ball in drain preventing water flow;",
        "service_amount" : "Amount:50;Amount1:10;Amount2:20;Amount3:10;Amount4:;Amount5:;Amount6:;Amount7:;Amount8:;Amount9:;",
        "product" : "Location:Kitchen;",
    ]

    var isNewContract = true
    
    @IBAction func signaturePage(_ sender: Any) {
        print("Signature")
        
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
        
        
    }
    
    func checkIfBlankAndOthersPushRow(tagChosen: String, row: (PushRow<String>)){
        if currentDataJSON[row.tag!].exists() && currentDataJSON[row.tag!].string != ""{
            row.value = currentDataJSON[row.tag!].string
            row.baseCell.backgroundColor = UIColor.white
        }
        else {
            row.noValueDisplayText = tagChosen
        }
        row.selectorTitle = "Pick One"
    }
    
    func checkIfBlankAndOthersNameRow(tagChosen: String,row: (NameRow)) {
        if currentDataJSON[row.tag!].exists() && currentDataJSON[row.tag!].string != ""{
            row.value = currentDataJSON[row.tag!].string
        }
        else {
            row.placeholder = tagChosen
            row.placeholderColor = UIColor.gray
        }
        
        
    }
    func checkIfBlankAndOthersPhoneRow(tagChosen: String,row: (PhoneRow)) {
        if currentDataJSON[row.tag!].exists() && currentDataJSON[row.tag!].string != ""{
            row.value = currentDataJSON[row.tag!].string
        }
        else {
            row.placeholder = tagChosen
            row.placeholderColor = UIColor.gray
        }
        
        
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(currentDataJSON)
        //
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
//            <<< TextRow(){row in
//                row.title = "CUSTOMER:"
//                row.placeholder = "Customer Type"
//                row.placeholderColor = UIColor.gray
//        }
            
            
            
            
//            <<< DateInlineRow() {
//                $0.title = "DateInlineRow"
//                $0.value = Date()
//            }
//
//            <<< TimeInlineRow(){
//                $0.title = "TimeInlineRow"
//                $0.value = Date()
//            }
//            <<< SwitchRow("Show Next Row"){
//                $0.title = $0.tag
//            }
//            <<< SwitchRow("Show Next Section"){
//                $0.title = $0.tag
//                $0.hidden = .function(["Show Next Row"], { form -> Bool in
//                    let row: RowOf<Bool>! = form.rowBy(tag: "Show Next Row")
//                    return row.value ?? false == false
//                })
//            }
//
//            +++ Section(footer: "This section is shown only when 'Show Next Row' switch is enabled"){
//                $0.hidden = .function(["Show Next Section"], { form -> Bool in
//                    let row: RowOf<Bool>! = form.rowBy(tag: "Show Next Section")
//                    return row.value ?? false == false
//                })
//            }
//            <<< TextRow() {
//                $0.placeholder = "Gonna dissapear soon!!"
//            }


//        form.last! <<< SegmentedRow<String>("Segments2") { $0.title = "Choose an animal"; $0.value = "🐼"; $0.options = ["🐼", "🐶", "🐻"]
//            }.onCellSelection { cell, row in
//                print("\(cell) for \(row) got selected")
//        }
//        form.last! <<< LabelRow("Confirm") {
//            $0.title = "Are you sure you do not want the 🐼?"
//            $0.hidden = "$Segments2 == '🐼'"
//            }

            
            

            //TO HERE
            
            
            <<< PushRow<String>() {row in
                row.tag = "customer_of"
                row.title = "CUSTOMER OF:"
                row.options = ["AHS", "NON-AHS"]
                checkIfBlankAndOthersPushRow(tagChosen: "Customer Type" ,row: row)
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
            
            <<< PushRow<String>() {row in
                row.tag = "description[Description]"
                row.title = "DESCRIPTION:"
                row.options = ["Test 2", "Leaking Toilet"]
                checkIfBlankAndOthersPushRow(tagChosen: "Description",row: row)
                row.selectorTitle = "Choose a Plumber"
                }.onPresent { from, to in
                    to.dismissOnSelection = true
                    to.dismissOnChange = true
            }
            
            <<< TextRow(){row in
                row.title = "DESCRIPTION:"
                row.placeholder = "Description"
                row.placeholderColor = UIColor.gray
        }
            <<< TextRow(){row in
                row.title = "DIAGNOSIS:"
                row.placeholder = "Diagnosis"
                row.placeholderColor = UIColor.gray
        }
            <<< TextRow(){row in
                row.title = "RESOLUTION:"
                row.placeholder = "Resolution"
                row.placeholderColor = UIColor.gray
        }
            <<< LabelRow(){row in
                row.cell.backgroundColor = UIColor.clear
                
            }
            <<< TextRow(){row in
                row.title = "DESCRIPTION 2:"
                row.placeholder = "Description"
                row.placeholderColor = UIColor.gray
            }
            <<< TextRow(){row in
                row.title = "DIAGNOSIS 2:"
                row.placeholder = "Diagnosis"
                row.placeholderColor = UIColor.gray
            }
            <<< TextRow(){row in
                row.title = "RESOLUTION 2:"
                row.placeholder = "Resolution"
                row.placeholderColor = UIColor.gray
        }
            <<< LabelRow(){row in
                row.cell.backgroundColor = UIColor.clear
                
            }
            <<< TextRow(){row in
                row.title = "DESCRIPTION 3:"
                row.placeholder = "Description"
                row.placeholderColor = UIColor.gray
            }
            <<< TextRow(){row in
                row.title = "DIAGNOSIS 3:"
                row.placeholder = "Diagnosis"
                row.placeholderColor = UIColor.gray
            }
            <<< TextRow(){row in
                row.title = "RESOLUTION 3:"
                row.placeholder = "Resolution"
                row.placeholderColor = UIColor.gray
        }
        
        form +++ Section("Service & Payment"){
            $0.tag = "service"
            $0.hidden = "$option != 'Service'"
            }
            
            <<< TextRow(){row in
                row.title = "SERVICE:"
                row.placeholder = "Service Type"
                row.placeholderColor = UIColor.gray
            }
            <<< DecimalRow() {
                $0.title = "AMOUNT:"
                $0.formatter = DecimalFormatter()
                $0.useFormatterDuringInput = true
                //$0.useFormatterOnDidBeginEditing = true
                }.cellSetup { cell, _  in
                    cell.textField.keyboardType = .numberPad
            }
            <<< LabelRow(){row in
                row.cell.backgroundColor = UIColor.clear
                
            }

            <<< TextRow(){row in
                row.title = "SERVICE 2:"
                row.placeholder = "Service Type"
                row.placeholderColor = UIColor.gray
            }
            <<< DecimalRow() {
                $0.title = "AMOUNT 2:"
                $0.formatter = DecimalFormatter()
                $0.useFormatterDuringInput = true
                //$0.useFormatterOnDidBeginEditing = true
                }.cellSetup { cell, _  in
                    cell.textField.keyboardType = .numberPad
            }
            <<< LabelRow(){row in
                row.cell.backgroundColor = UIColor.clear
                
        }
            <<< TextRow(){row in
                row.title = "SERVICE 3:"
                row.placeholder = "Service Type"
                row.placeholderColor = UIColor.gray
            }
            <<< DecimalRow() {
                $0.title = "AMOUNT 3:"
                $0.formatter = DecimalFormatter()
                $0.useFormatterDuringInput = true
                //$0.useFormatterOnDidBeginEditing = true
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
            
            <<< TextRow(){row in
                row.title = "LOCATION:"
                row.placeholder = "Location"
                row.placeholderColor = UIColor.gray
        }
            <<< TextRow(){row in
                row.title = "BRANDS:"
                row.placeholder = "Brands"
                row.placeholderColor = UIColor.gray
        }
            <<< TextRow(){row in
                row.title = "FIXTURE TYPE:"
                row.placeholder = "Fixture Type"
                row.placeholderColor = UIColor.gray
        }
            <<< TextRow(){row in
                row.title = "FINISH/COLOR:"
                row.placeholder = "Finish/Color"
                row.placeholderColor = UIColor.gray
        }
            <<< LabelRow(){row in
                row.cell.backgroundColor = UIColor.clear
                
        }
            <<< TextRow(){row in
                row.title = "LOCATION 2:"
                row.placeholder = "Location"
                row.placeholderColor = UIColor.gray
            }
            <<< TextRow(){row in
                row.title = "BRANDS 2:"
                row.placeholder = "Brands"
                row.placeholderColor = UIColor.gray
            }
            <<< TextRow(){row in
                row.title = "FIXTURE TYPE 2:"
                row.placeholder = "Fixture Type"
                row.placeholderColor = UIColor.gray
            }
            <<< TextRow(){row in
                row.title = "FINISH/COLOR 2:"
                row.placeholder = "Finish/Color"
                row.placeholderColor = UIColor.gray
            }
            <<< LabelRow(){row in
                row.cell.backgroundColor = UIColor.clear
                
        }
            <<< TextRow(){row in
                row.title = "LOCATION 3:"
                row.placeholder = "Location"
                row.placeholderColor = UIColor.gray
            }
            <<< TextRow(){row in
                row.title = "BRANDS 3:"
                row.placeholder = "Brands"
                row.placeholderColor = UIColor.gray
            }
            <<< TextRow(){row in
                row.title = "FIXTURE TYPE 3:"
                row.placeholder = "Fixture Type"
                row.placeholderColor = UIColor.gray
            }
            <<< TextRow(){row in
                row.title = "FINISH/COLOR 3:"
                row.placeholder = "Finish/Color"
                row.placeholderColor = UIColor.gray
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
