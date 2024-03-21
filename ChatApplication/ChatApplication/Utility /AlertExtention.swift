//
//  AlertExtention.swift
//  ChatApplication
//
//  Created by neosoft on 21/03/24.
//

import Foundation
import UIKit

extension UIAlertController {
    static func showAlert(title: String?, message: String?, preferredStyle: UIAlertController.Style = .alert, actions: [UIAlertAction] = [], completion: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        if actions.isEmpty {
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(okAction)
        } else {
            for action in actions {
                alertController.addAction(action)
            }
        }
        UIApplication.shared.windows.first?.rootViewController?.present(alertController, animated: true, completion: completion)
    }
}
