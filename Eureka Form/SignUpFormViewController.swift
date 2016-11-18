//
//  SignUpFormViewController.swift
//  Eureka Form
//
//  Created by JohnP on 11/18/16.
//  Copyright © 2016 JohnP. All rights reserved.
//

import UIKit
import Eureka
import EZSwiftExtensions

class SignUpFormViewController: FormViewController {
    let MAIN_COLOR = UIColor.init(hexString: "ddd")
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        form +++
            Section("Basic info")
        <<< NameFloatLabelRow() { row in
            row.title = "First Name:"
            row.tag = "firstName"
            row.add(rule: RuleRequired())
        }
        .onRowValidationChanged { cell, row in
                let rowIndex = row.indexPath!.row
                while row.section!.count > rowIndex + 1 && row.section?[rowIndex + 1] is LabelRow {
                    row.section?.remove(at: rowIndex + 1)
                }
                if !row.isValid {
                    for (index, _) in row.validationErrors.map({ $0.msg }).enumerated() {
                        let labelRow = LabelRow() {
                            $0.title = "This field is required"
                            $0.cell.height = { 20 }
                        }
                        row.section?.insert(labelRow, at: row.indexPath!.row + index + 1)
                    }
                }
            }
        <<< TextRow() { row in
            row.title = "Last Name:"
            row.placeholder = "John"
            row.tag = "lastName"
            row.add(rule: RuleRequired())
        }
        <<< DateRow() { row in
            row.title = "DoB:"
            row.add(rule: RuleRequired())
        }
        <<< PushRow<String>() {
            $0.title = "Country"
            $0.options = ["Vietnam", "Laos", "Campuchia", "China"]
            $0.value = "China"
            $0.selectorTitle = "Choose an Country!"
            $0.add(rule: RuleRequired())
        }
            +++
            Section("Account info")
        <<< EmailRow("Email:") { row in
            row.title = "Email:"
            row.placeholder = "john@quizota.com"
            row.add(rule: RuleRequired())
        }
        <<< PasswordRow("Password:") { row in
            row.title = "Password:"
        }

        <<< ButtonRow("SubmitForm") { row in
            row.title = "Submit"
        }.cellUpdate({ (cell, row) in
            cell.backgroundView?.backgroundColor = self.MAIN_COLOR!
            cell.textLabel?.textColor = .white
            cell.tintColor = self.MAIN_COLOR
            cell.backgroundColor = self.MAIN_COLOR!
        })
            .onCellSelection { cell, row in
                print(self.form.values())
                row.section?.form?.validate()
                if self.form.validate().count == 0 {
                }

        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    /*
    // Custom Field Design
     <<< InfoLabelRow() { row in
     
     if let cell = row.baseCell as? InfoLabelCell {
     cell.label.text = "Sản phẩm"
     cell.value.text = order["Device"].stringValue
     }
     }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
