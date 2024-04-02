//
//  ChatvcExtention.swift
//  ChatApplication
//
//  Created by neosoft on 21/03/24.
//

import Foundation
import UIKit
import FirebaseCore
import FirebaseDatabase
import FirebaseCoreInternal

extension ChatVcViewController : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let messageSnapshot = self.messages[indexPath.row]
        let message = messageSnapshot.value as? [String: String]
        let name = message?["name"] ?? ""
        if name == "you"
        {
                let cell = tableView.dequeueReusableCell(withIdentifier: "SendMessageCell") as! SendMessageCell
                let messageSnapshot = self.messages[indexPath.row]
                guard let message = messageSnapshot.value as? [String: String] else { return cell }
                let name = message["name"] ?? ""
                let text = message["text"] ?? ""
                cell.messageContent?.text =  text
                cell.setCurrentTimeLabelText(to: cell.timeLbl)
                return cell
        }
        else
        {
             let cell = tableView.dequeueReusableCell(withIdentifier: "RecievedMessageCell") as! RecievedMessageCell
             let messageSnapshot = self.messages[indexPath.row]
             guard let message = messageSnapshot.value as? [String: String] else { return cell }
             let name = message["name"] ?? ""
             let text = message["text"] ?? ""
             cell.messageContent?.text =  text
             cell.setCurrentTimeLabelText(to: cell.timeLbl)
             return cell
        }
    }
}

