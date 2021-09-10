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
        
        form +++ Section("Kullanıcı Bilgileri")
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
            
            +++ Section("Başlık 3")
        
        
        
        form +++ Section(footer: "Eureka sets table.isEditing = true only if the form contains a MultivaluedSection. SwipeActions only work when isEditing = false, therefore you have to set that in ViewWillAppear. Both can't be used on the same form.")
            
            <<< LabelRow("Sola kaydırma seçeneği ios 7") {
                $0.title = $0.tag
                
                let moreAction = SwipeAction(style: .normal, title: "Fazla", handler: { (action, row, completionHandler) in
                    print("More")
                    completionHandler?(true)
                })
                
                let deleteAction = SwipeAction(style: .destructive, title: "Sil") { (action, row, completionHandler) in
                    print("Sil")
                    completionHandler?(true)
                }
                
                $0.trailingSwipe.actions = [deleteAction,moreAction]
                
            }
            
            <<< LabelRow("Sağa ve sola kaydırın ios 11Sağa ve sola kaydırın ios 11Sağa ve sola kaydırın ios 11Sağa ve sola kaydırın ios 11") {
                $0.title = $0.tag
                
                
                let moreAction = SwipeAction(style: .normal, title: "Fazla") { (action, row, completionHandler) in
                    print("More")
                    completionHandler?(true)
                }
                
                let deleteAction = SwipeAction(style: .destructive, title: "Delete", handler: { (action, row, completionHandler) in
                    print("Delete")
                    completionHandler?(true)
                })
                
                $0.trailingSwipe.actions = [deleteAction,moreAction]
                $0.trailingSwipe.performsFirstActionWithFullSwipe = true
                
                if #available(iOS 11,*) {
                    let infoAction = SwipeAction(style: .normal, title: "Bilgi", handler: { (action, row, completionHandler) in
                        print("Info")
                        completionHandler?(true)
                    })
                    infoAction.actionBackgroundColor = .lightGray
                    
                    $0.leadingSwipe.actions = [infoAction]
                    $0.leadingSwipe.performsFirstActionWithFullSwipe = true
                }
            }
        
    }
    
    
}

