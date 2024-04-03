//
//  UserVcExcention.swift
//  ChatApplication

//  Created by neosoft on 21/03/24.

import Foundation
import UIKit

extension UserVc: UITableViewDelegate,UITableViewDataSource
{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Usercell") as! Usercell
        let userName = self.viewModel.names[indexPath.row]
        cell.userName?.text = userName
        cell.userMessage?.text = des
        cell.cellview.layer.cornerRadius  = 25
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .medium

//        let currentTimeString = dateFormatter.string(from: Date())
//        let created_date = currentTimeString
//        let date = NSDate(timeIntervalSince1970: TimeInterval(created_date) ?? 0)
//        let formatter = DateFormatter()
//       
//        formatter.dateFormat = "HH:mm:ss"
//        formatter.locale = NSLocale(localeIdentifier: "en_US") as Locale?
//        let now = MFormatter().dateDiff(dateStr: formatter.string(from: date as Date))
//        cell.timeshow.text = (now)
//        cell.timeshow.text = (publishedOn(created_date:currentTimeString))
        
        cell.setCurrentTimeLabelText(to: cell.timeshow)
        cell.cellview.layer.backgroundColor  = UIColor.white.cgColor
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let viewController = storyboard?.instantiateViewController(withIdentifier: "ChatVcViewController") as? ChatVcViewController else { return }
            viewController.userName = viewModel.names[indexPath.row]
       
            navigationController?.pushViewController(viewController, animated:false)
    }
    
    func publishedOn(created_date:String) -> String
    {
        let date = NSDate(timeIntervalSince1970: TimeInterval(created_date) ?? 0)
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-M-dd'T'HH:mm:ss.SSSZZZ"
        formatter.locale = NSLocale(localeIdentifier: "en_US") as Locale?
        let now = MFormatter().dateDiff(dateStr: formatter.string(from: date as Date))
        return now
    }
}
