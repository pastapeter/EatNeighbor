//
//  HomeTableViewController.swift
//  DeliveryService
//
//  Created by abc on 2021/02/26.
//

import UIKit

var storeArray = ["슬슬브라우니", "아름돈카츠", "선데이밀 강남점", "바이러브하니", "맥도날드", "버거킹"]
var storeImageArray = ["1.jpeg", "2.jpeg", "3.jpeg", "4.jpeg", "5.jpeg", "6.jpeg" ]
class HomeTableViewController: UITableViewController{

    @IBOutlet var tableViewcell: UITableView!
    let cellSpacingHeight: CGFloat = 5
    var dataList = [[String:String]]()
    let background = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for index in 0...storeArray.count - 1{
            dataList.append(["storeName":storeArray[index], "img":storeImageArray[index]])
        }
        tableViewcell.separatorStyle = UITableViewCell.SeparatorStyle.none
        //tableViewcell.delegate = self
        //tableViewcell.dataSource = self
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let placeOrderViewController = segue.destination as! placeOrderViewController
        if segue.identifier == "placeOrder" {
            print("fuck")
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return storeArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! tableViewCellTableViewCell
        let currentCellStore = dataList[indexPath.row]
        cell.lblstoreName.text = currentCellStore["storeName"]
        cell.storeImgView.image = UIImage(named: currentCellStore["img"]!)

    
        let attachment = NSTextAttachment()
        attachment.image = UIImage(named: "heart")
        let attachmentString = NSAttributedString(attachment: attachment)
        let contentString = NSMutableAttributedString(string: "2/3")
        contentString.append(attachmentString)
        cell.lblPeopleNum.attributedText = contentString
        
        
        cell.entireCellstack.addBackground(color: .white)
        cell.entireCellstack.layer.shadowOpacity = 0.3
        cell.entireCellstack.layer.shadowOffset = CGSize(width: 10, height: 0)
        cell.entireCellstack.layer.shadowRadius = 10
        cell.entireCellstack.layer.masksToBounds = false
        
        
        // background 회색 ㄴㄴ
        background.backgroundColor = .clear
        cell.selectedBackgroundView = background

//        cell.storeNameStack.layer.addBorder([.bottom], color: UIColor.gray, width: 1)
//        cell.lblPeopleNum.layer.addBorder([.right], color: UIColor.gray, width: 1)
        //cell.entireCellstack.layer.addBorder([.all], color: UIColor.gray, width: 1)
        return cell
    }

}
extension CALayer {
    func addBorder(_ arr_edge:[UIRectEdge], color: UIColor, width: CGFloat){
        for edge in arr_edge{
            let border = CALayer()
            switch edge {
            case UIRectEdge.top:
                border.frame = CGRect.init(x: 0, y: 0, width: frame.width, height: width)
                break
            case UIRectEdge.bottom:
                border.frame = CGRect.init(x: 0, y: frame.height - width, width: frame.width, height: width)
                break
            case UIRectEdge.left:
                border.frame = CGRect.init(x: 0, y: 0, width: width, height: frame.height)
                break
            case UIRectEdge.right:
                border.frame = CGRect.init(x: frame.width - width, y: 0, width: width, height: frame.height)
                break
            default:
                break
            }
            border.backgroundColor = color.cgColor;
            self.addSublayer(border)
            }
        }
    
    }

extension UIStackView {
    func addBackground(color: UIColor){
        let subView = UIView(frame: bounds)
        subView.backgroundColor = color
        subView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        insertSubview(subView, at: 0)
    }
}


