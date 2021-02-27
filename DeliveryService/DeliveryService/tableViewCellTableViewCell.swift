//
//  tableViewCellTableViewCell.swift
//  DeliveryService
//
//  Created by abc on 2021/02/26.
//
import UIKit

class tableViewCellTableViewCell: UITableViewCell {

    @IBOutlet var storeImgView: UIImageView!
    @IBOutlet var lblstoreName: UILabel!
    @IBOutlet var lblPoint: UILabel!
    @IBOutlet var lblDistance: UILabel!
    @IBOutlet var lblPeopleNum: UILabel!
    @IBOutlet var lblperson1: UILabel!
    @IBOutlet var lblperson2: UILabel!
    @IBOutlet var btnMorePeople: UIButton!

    @IBOutlet var placeOrder: UIButton!
    @IBOutlet var storeNameStack: UIStackView!
    @IBOutlet var entireCellstack: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
