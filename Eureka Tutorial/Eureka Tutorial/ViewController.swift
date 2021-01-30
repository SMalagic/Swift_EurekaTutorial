//
//  ViewController.swift
//  Eureka Tutorial
//
//  Created by Serkan Mehmet Malagiç on 30.01.2021.
//

import UIKit
import Eureka

class ViewController: FormViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        form +++ Section("Kullanıcı Ayarları")
                    <<< TextRow(){ row in
                        row.title = "Text Row"
                        row.placeholder = "Enter text here"
                    }
                    <<< PhoneRow(){
                        $0.title = "Phone Row"
                        $0.placeholder = "And numbers here"
                    }
                +++ Section("Tarih Ayarları")
                    <<< DateRow(){
                        $0.title = "Date Row"
                        $0.value = Date(timeIntervalSinceReferenceDate: 0)
                        
                    }.onChange({ (row) in
                        if let value = row.value {
                            print(value)
                        }
                    })
        
        
        
        
    }


}

