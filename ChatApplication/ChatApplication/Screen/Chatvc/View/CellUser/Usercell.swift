//
//  Usercell.swift
//  ChatApplication
//
//  Created by neosoft on 21/03/24.
//

import UIKit

class Usercell: UITableViewCell {
    
    @IBOutlet weak var imgCell: UIImageView!
    @IBOutlet weak var cellview: UIView!
    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var timeshow: UILabel!
    
    @IBOutlet weak var userMessage: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configurecell()
    {
        
    }
    
}
