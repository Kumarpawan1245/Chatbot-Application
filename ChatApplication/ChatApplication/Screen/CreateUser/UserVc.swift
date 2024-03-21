//
//  ViewController.swift
//  ChatApplication
//
//  Created by neosoft on 21/03/24.

import UIKit

class UserVc: UIViewController {
    
    @IBOutlet var tblView: UITableView!
    var names: [String] = []
    var index = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUi()
    }
    
    private func setupUi()
    {
        tblView.delegate = self
        tblView.dataSource = self
        let nib = UINib(nibName: "Usercell", bundle: nil)
        tblView.register(nib, forCellReuseIdentifier: "Usercell")
        
//        tblView.register(UITableViewCell.self,forCellReuseIdentifier: "Usercell")
//        tblView.register(Usercell.self, forCellReuseIdentifier: "Usercell")
    }

    func editDel(name: String) {

    }
    
    
    func deleteindex(indexpath: String) {
        
    }
    
    
    
    @IBAction func addicon(_ sender: Any) {
        presentNameInputAlert()
    }
    
    func presentNameInputAlert() {
            let alertController = UIAlertController(title:alertTitle, message: nil, preferredStyle: .alert)
            alertController.addTextField { textField in
                textField.placeholder = "Name"
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            let addAction = UIAlertAction(title: "Add", style: .default) { _ in
                if let name = alertController.textFields?.first?.text, !name.isEmpty {
                    self.names.append(name)
                    self.tblView.reloadData()
                }
            }
            alertController.addAction(cancelAction)
            alertController.addAction(addAction)
            present(alertController, animated: true, completion: nil)
        }

}

