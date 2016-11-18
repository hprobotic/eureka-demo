//
//  SignUpFormViewController.swift
//  Eureka Form
//
//  Created by JohnP on 11/18/16.
//  Copyright © 2016 JohnP. All rights reserved.
//

import UIKit
import Eureka

class SignUpFormViewController: FormViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        form +++
            Section("Basic info")
        <<< TextRow() { row in
            row.title = "First Name:"
            row.placeholder = "John"
        }
        <<< TextRow() { row in
            row.title = "Last Name:"
            row.placeholder = "John"
        }
        <<< DateRow() { row in
            row.title = "DoB:"
        }
        <<< PushRow<String>() {
            $0.title = "Coutry"
            $0.options = ["Vietnam", "Laos", "Campuchia", "China"]
            $0.value = "China"
            $0.selectorTitle = "Choose an Coutry!"
        }
            +++
            Section("Account info")
        <<< EmailRow("Email:") { row in
            row.title = "Email:"
            row.placeholder = "john@quizota.com"
        }
        <<< PasswordRow("Password:") { row in
            row.title = "Password:"
        }

        <<< ButtonRow("SubmitForm") { row in
            row.title = "Submit"
        }
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
