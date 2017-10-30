//
//  DetailTableViewController.swift
//  UITableViewController
//
//  Created by YXY on 2017/10/22.
//  Copyright © 2017年 YXY. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {
    @IBOutlet weak var LargeImageView: UIImageView!
    @IBOutlet weak var ratingBtn: UIButton!
    var area: AreaMO!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //防止报一个小错
        //self.tableView.rowHeight = 44
        
        LargeImageView.image = UIImage(data: area.image!)
        tableView.backgroundColor = UIColor(white: 0.98, alpha: 1)
        tableView.separatorColor = UIColor(white: 0.9, alpha: 1)
        //删除多余空行
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        //启用单元格自适应(一行显示不开显示多行，还要设置"字段值"那个stack view相对容器的顶距和底距为0，并把要显示的内容的容器(Label的lines)lines设为0)
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableViewAutomaticDimension
        
        
        //设置本页标题
        self.title = area.name

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    
    //返回原型单元格列数
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    //返回原型单元格行数
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }
    //组装原型单元格样式，重用原型单元格
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath) as! DetailTableViewCell
        cell.backgroundColor = UIColor.clear

        switch indexPath.row {
        case 0:
            cell.fieldLabel.text = "地名"
            cell.valueLabel.text = area.name
        case 1:
            cell.fieldLabel.text = "省"
            cell.valueLabel.text = area.province
        case 2:
            cell.fieldLabel.text = "地区"
            cell.valueLabel.text = area.part
        case 3:
            cell.fieldLabel.text = "去过与否"
            cell.valueLabel.text = area.isVisited ? "去过" : "没去过"
        default:
            break
        }
        
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showMap" {
            let destVC = segue.destination as! MapViewController
            destVC.area = area
        }
    }
    

    //反向转场：在返回到的控制器文件中写下列方法，参数有且仅有一个且必为UIStoryboardSegue
    //IBAction表明是storyboard上的一个事件
    @IBAction func close(segue: UIStoryboardSegue) {
        let revealVC = segue.source as! ReviewViewController
        if let rating = revealVC.rating {
            self.area.rating = rating
            self.ratingBtn.setImage(UIImage(named: rating), for: .normal)
        }
    }
}
