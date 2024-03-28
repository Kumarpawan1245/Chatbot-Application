//
//  ViewController.swift
//  ChatApplication
//
//  Created by neosoft on 21/03/24.

import UIKit
import FirebaseAuth
import Firebase
import FirebaseStorage

class UserVc: UIViewController {
    
    @IBOutlet var tblView: UITableView!
    var names: [String] = []
    var index = 0
    var userName = ""
    

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
                textField.placeholder = nameplaceholder
            }
            let cancelAction = UIAlertAction(title:cancelbtn, style: .cancel, handler: nil)
            let addAction = UIAlertAction(title:submit, style: .default) { _ in
                if let name1 = alertController.textFields?.first?.text, !name1.isEmpty {
                    self.userName = name1
                    self.names.append(name1)
                    self.createUser()
                    self.tblView.reloadData()
                    
                }
            }
            alertController.addAction(cancelAction)
            alertController.addAction(addAction)
            present(alertController, animated: true, completion: nil)
        }
 
    func createUser()
     {
        DataBaseManager.shared.userExists(with:userName ,Completion:{ exist  in
        guard !exist else
        {
            return
        }
            FirebaseAuth.Auth.auth().createUser(withEmail:self.userName + concatwithUserName, password: userpassword, completion: { authresult , error  in
            guard let result = authresult,error == nil else
           {
            print(erroroccur)
            return
        }
        let userDetail = result.user
        print("\(userDetail)")
    })
    })
    }
}

