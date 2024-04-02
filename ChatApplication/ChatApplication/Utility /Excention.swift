//
//  Excention.swift
//  ChatApplication
//
//  Created by neosoft on 02/04/24.
//

import Foundation
import UIKit

extension UITableViewCell
{
    func setCurrentTimeLabelText(to label: UILabel) {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .medium
        let currentTimeString = dateFormatter.string(from: Date())
        label.text = currentTimeString
    }
}
