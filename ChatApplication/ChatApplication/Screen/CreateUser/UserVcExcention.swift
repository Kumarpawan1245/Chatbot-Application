//
//  UserVcExcention.swift
//  ChatApplication
//
//  Created by neosoft on 21/03/24.

import Foundation
import UIKit

extension UserVc: UITableViewDelegate,UITableViewDataSource
{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Usercell") as! Usercell
        let userName = self.names[indexPath.row]
        cell.userName?.text = userName
        cell.userMessage?.text = "how are you fine"
        cell.cellview.layer.cornerRadius  = 25
        cell.cellview.layer.backgroundColor  = UIColor.white.cgColor
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        let editvc = self.storyboard?.instantiateViewController(withIdentifier: "EditVC") as! EditVC
        //        let userName1 = self.user![indexPath.row]
        //        editvc.name = userName1.pankaj ?? ""
        //        self.index = indexPath.row
        //        editvc.deleteindex = self
        //        editvc.delegateedit  = self
        //        self.navigationController?.pushViewController(editvc, animated: false)
    }
}
