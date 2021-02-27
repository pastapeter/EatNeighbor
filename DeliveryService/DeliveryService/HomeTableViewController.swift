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
    
    var dataList = [[String:String]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for index in 0...storeArray.count - 1{
            dataList.append(["storeName":storeArray[index], "img":storeImageArray[index]])
        }
        
        //tableViewcell.delegate = self
        //tableViewcell.dataSource = self
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
        cell.storeNameStack.layer.addBorder([.bottom], color: UIColor.gray, width: 1)
        cell.lblPeopleNum.layer.addBorder([.right], color: UIColor.gray, width: 1)
        //cell.entireCellstack.layer.addBorder([.all], color: UIColor.gray, width: 1)
        return cell
    }
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

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


