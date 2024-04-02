//  ViewController.swift
//  ChatApplication
//  Created by neosoft on 21/03/24.

import UIKit
import FirebaseAuth
import Firebase
import FirebaseStorage
import FirebaseDatabase

class UserVc: UIViewController {
    
    
    @IBOutlet var tblView: UITableView!
    var names: [String] = []
    var userName = ""
    var fetchuserName = ""
    var  ref1 = Database.database().reference()
    let  viewModel = NameInputViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUi()
        fetchUsernames()
    }
    
    func fetchUsernames() { // user that already create the node in firebase.
        ref1.observeSingleEvent(of: .value, with: { snapshot in
         // Check if the snapshot contains any data
            guard snapshot.exists() else {
                print(erroroccur)
                return
            }
            //Loop through the children of the snapshot
            for child in snapshot.children {
                // Check if the child is a DataSnapshot
                guard let dataSnapshot = child as? DataSnapshot else {
                    continue
                }
                // Access the value of the child and print it (assuming the child represents a username)
                if let usernamevalue = dataSnapshot.key as? String {
                    self.viewModel.addUser(name: usernamevalue)
//                    self.names.append(usernamevalue)
                    print(usernamevalue)
                    self.tblView.reloadData()
                }
            }
        })
    }

    private func setupUi()
     {
        tblView.delegate = self
        tblView.dataSource = self
        let nib = UINib(nibName: "Usercell", bundle: nil)
        tblView.register(nib, forCellReuseIdentifier: "Usercell")
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
                    if self.viewModel.checkUserExistence(name:name1) {
                                   self.showToast(message: userExit, font: .systemFont(ofSize: 12.0))
                                }else {
                                     self.viewModel.addUser(name: name1)
                                 }
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

