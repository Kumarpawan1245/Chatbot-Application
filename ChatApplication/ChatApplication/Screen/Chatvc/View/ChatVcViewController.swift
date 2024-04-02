//  ChatVcViewController.swift
//  ChatApplication
//  Created by neosoft on 21/03/24.


import UIKit
import FirebaseCore
import FirebaseDatabase
import FirebaseFirestore
import FirebaseAuth

class ChatVcViewController: UIViewController {

    @IBOutlet var tblViewChat: UITableView!
    @IBOutlet weak var sendtxtMsg: UITextField!
    @IBOutlet weak var sendbtnTxt: UIButton!
    
    @IBOutlet weak var topMenuLbl: UILabel!

    var userName  = ""
    var data = [String:String]()
    var replies = fetchReplyData()
    let  chatviewModel = Chatviewmodel()
//    let replyData = fetchReplyData()


    var messages: [DataSnapshot] = [] //contains data from a Firebase Database location.itcan't be modified and will never change
    override func viewDidLoad() {
        super.viewDidLoad()
        setui()
        configureDatabase()
    }
    // Chat data display
    func configureDatabase() {
        let result = DataBaseManager.shared.database.child(userName).child(subnode).observe(.childAdded, with: { [weak self] (snapshot) -> Void in
                    guard let strongSelf = self else { return }
                    strongSelf.messages.append(snapshot)
                    strongSelf.tblViewChat.insertRows(at: [IndexPath(row: strongSelf.messages.count-1, section: 0)], with: .automatic)
                })
         DispatchQueue.main.asyncAfter(deadline: .now() + 3){
            if self.messages.count == 0
            {
                var data1 = ["name":self.userName,"text":welcome]
                self.sendRandomMessage(withData: data1)
            }
        }
    }
    
    private func setui()
     {
        tblViewChat.delegate = self
        tblViewChat.dataSource = self
        let nib = UINib(nibName:"RecievedMessageCell", bundle: nil)
        tblViewChat.register(nib, forCellReuseIdentifier:"RecievedMessageCell")
        let nib1 = UINib(nibName:"SendMessageCell", bundle: nil)
        tblViewChat.register(nib1, forCellReuseIdentifier:"SendMessageCell")
        topMenuLbl.text = userName
    }

    @IBAction func back(_ sender:UIButton)
    {
      self.navigationController?.popViewController(animated: true)
    }

    @IBAction func send(_ sender:UIButton)
    {
        data = ["name":"you","text":sendtxtMsg.text!]
        sendMessage(withData: data)
        scrollToBottom()
    }

    func sendMessage(withData data: [String: String]) {
         var mdata = data
         DataBaseManager.shared.database.child(userName).child(subnode).childByAutoId().setValue(mdata)
        
        let question = sendtxtMsg.text ?? ""
        if let reply = chatviewModel.getReply(for: question) {
            let  datareply  = ["name":userName,"text":reply]
              sendRandomMessage(withData: datareply)
            // Use the reply
            print(reply)
        } else {
            let  datareply  = ["name":userName,"text":errormsg]
             sendRandomMessage(withData: datareply)
        }
              sendtxtMsg.text = ""
    }
    
   

    func sendRandomMessage(withData data: [String: String]) {
        var mdata = data
        DataBaseManager.shared.database.child(userName).child(subnode).childByAutoId().setValue(mdata)
         sendtxtMsg.text = ""
    }

    func scrollToBottom()
     {
            DispatchQueue.main.async {
                let indexPath = IndexPath(row:self.messages.count - 1, section:0)
                self.tblViewChat.scrollToRow(at: indexPath, at: .top, animated: true)
            }
        }
}


//class Sir
//{
//    static let shared = Sir()
//    private init()
//    {
//        
//    }
//    func assigent()
//    {
//        
//    }
//}
//
//let obj = Sir.shared.assigent()







