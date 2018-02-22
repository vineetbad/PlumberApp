//
//  ContractNewFormViewController.swift
//  PlumberApp
//
//  Created by Vineet Baid on 14/02/18.
//  Copyright © 2018 Vineet Baid. All rights reserved.
//

import UIKit
import Eureka

class ContractNewFormViewController: FormViewController {
    
    @IBAction func signaturePage(_ sender: Any) {
        print("Signature")
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
            <<< TextRow(){row in
                row.title = "CUSTOMER:"
                row.placeholder = "Customer Type"
                row.placeholderColor = UIColor.gray
        }
            
            
            //DELETE HERE
            
            
            
            <<< DateInlineRow() {
                $0.title = "DateInlineRow"
                $0.value = Date()
            }
            
            <<< TimeInlineRow(){
                $0.title = "TimeInlineRow"
                $0.value = Date()
            }
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

            
            <<< PushRow<String>() {
                $0.title = "PushRow"
                $0.options = ["💁🏻", "🍐", "👦🏼", "🐗", "🐼", "🐻"]
                $0.value = "👦🏼"
                $0.selectorTitle = "Choose an Emoji!"
                }.onPresent { from, to in
                    to.dismissOnSelection = true
                    to.dismissOnChange = true
            }

            //TO HERE

            <<< IntRow(){row in
                row.title = "DISPATCH ID:"
                row.placeholder = "Dispatch Id"
                row.placeholderColor = UIColor.gray
        }
            <<< TextRow(){row in
                row.title = "GATE CODE:"
                row.placeholder = "Gate Code"
                row.placeholderColor = UIColor.gray
            }
            

            <<< NameRow(){row in
                row.title = "PLUMBER:"
                row.placeholder = "Plumber"
                row.placeholderColor = UIColor.gray
        }
            <<< NameRow(){row in
                row.title = "FIRST NAME:"
                row.placeholder = "First Name"
                row.placeholderColor = UIColor.gray
        }
            <<< NameRow(){row in
                row.title = "LAST NAME:"
                row.placeholder = "Last Name"
                row.placeholderColor = UIColor.gray
            }
            <<< TextRow(){row in
                row.title = "ADDRESS:"
                row.placeholder = "Address"
                row.placeholderColor = UIColor.gray
            }
            <<< TextRow(){row in
                row.title = "CITY:"
                row.placeholder = "City"
                row.placeholderColor = UIColor.gray
        }
            <<< TextRow(){row in
                row.title = "STATE:"
                row.placeholder = "State"
                row.placeholderColor = UIColor.gray
        }
            <<< ZipCodeRow(){row in
                row.title = "ZIP:"
                row.placeholder = "Zip"
                row.placeholderColor = UIColor.gray
        }
            <<< PhoneRow(){row in
                row.title = "PHONE:"
                row.placeholder = "Phone (primary)"
                row.placeholderColor = UIColor.gray
        }
            <<< PhoneRow(){row in
                row.title = "PHONE:"
                row.placeholder = "Phone (secondary)"
                row.placeholderColor = UIColor.gray
        }
            <<< PhoneRow(){row in
                row.title = "MOBILE:"
                row.placeholder = "Mobile"
                row.placeholderColor = UIColor.gray
        }
            <<< EmailRow(){row in
                row.title = "EMAIL:"
                row.placeholder = "Email ID"
                row.placeholderColor = UIColor.gray
        }
            <<< TextRow(){row in
                row.title = "TENANT:"
                row.placeholder = "Tenant"
                row.placeholderColor = UIColor.gray
        }
            <<< PhoneRow(){row in
                row.title = "TENANT PHONE:"
                row.placeholder = "Tenant Phone"
                row.placeholderColor = UIColor.gray
        }
        form +++ Section("Specifications"){
            $0.tag = "specs"
            $0.hidden = "$option != 'Specs'"
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
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
