//
//  SafeAreaExtenyion.swift
//  ChatApplication
//
//  Created by neosoft on 02/04/24.
//

import Foundation
import UIKit

extension UIViewController
{
    func changeHomeSafeAreaColor1(){
        var gi = ""
        if UIDevice.current.userInterfaceIdiom == .pad {
            // It's an iPad
            print("This is an iPad.")
            gi = "Ipad"
        } else if UIDevice.current.userInterfaceIdiom == .phone {
            // It's an iPhone
            print("This is an iPhone.")
            gi = ""
        } else {
            // It's neither an iPad nor an iPhone (e.g., iPod Touch)
            print("This is neither an iPad nor an iPhone.")
            gi = ""
        }
        
        if gi == "Ipad" {
            let isLandscape = view.frame.size.width > view.frame.size.height
            let newWidth: CGFloat = isLandscape ? view.frame.size.width : view.frame.size.height
            
            let window = UIApplication.shared.windows.first
            if let topPadding = window?.safeAreaInsets.top{
                let newView = UIView(frame: CGRect(x: 0, y: 0, width: newWidth, height: topPadding))
                newView.backgroundColor = UIColor(red: 108/255, green: 179/255, blue: 180/255, alpha:1.0)
                view.addSubview(newView)
            }
            
        } else{
            let window = UIApplication.shared.windows.first
            if let topPadding = window?.safeAreaInsets.top{
                let newView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: topPadding))
                newView.backgroundColor =  UIColor(red: 108/255, green: 179/255, blue: 180/255, alpha:1.0)
                view.addSubview(newView)
            }
        }
    }
}
