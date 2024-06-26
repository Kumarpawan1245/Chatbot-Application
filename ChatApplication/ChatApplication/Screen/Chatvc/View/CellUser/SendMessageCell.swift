
import UIKit

class SendMessageCell: UITableViewCell {
    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var messageContent: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var heightShared: NSLayoutConstraint!
    @IBOutlet weak var imgShared: UIImageView!
    @IBOutlet weak var image_pinned: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func updateView() {
        profileImage.layer.cornerRadius = profileImage.frame.height/2
        profileImage.layer.borderWidth = 0.5
        profileImage.layer.borderColor = UIColor.lightGray.cgColor
        profileImage.clipsToBounds = true

        userName?.layer.masksToBounds = true
        userName?.layer.cornerRadius = 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}

