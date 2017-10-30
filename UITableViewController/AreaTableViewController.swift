//
//  AreaTableViewController.swift
//  UITableViewController
//
//  Created by YXY on 2017/10/20.
//  Copyright © 2017年 YXY. All rights reserved.
//

import UIKit

class AreaTableViewController: UITableViewController {

    /*
    var areas = ["闵行区莘庄镇","兰州七里河区","三明市尤溪县","西宁城西区","广州白云区","闽侯县上街镇","哈尔滨市南岗区","临汾市尧渡区","成都武侯区","汕头市金平区","长沙市芙蓉区"]
    var areaImages = ["xinzhuang","qilihe","youxi","chengxi","baiyun","shangjie","nangang","yaodu","wuhou","jinping","furong"]
    var provinces = ["上海","甘肃","福建","青海","广东","福建","黑龙江","山西","四川","广东","湖南"]
    var parts = ["华东","西北","东南","西北","华南","东南","东北","华北","西南","华南","华中"]
    var visited = [Bool](repeatElement(false, count: 11))
    //重用cell时同步更新选中(打钩)状态，避免出现未选项被打钩
    //上述代码等价于var visited = [false,false,...,false]11个false
    */
    var areas: [AreaMO] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        //修改返回按钮，仅保留一个箭头。
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        //详解：若在页面1中点击某项进入了页面2，希望在页面2的左上角只显示一个返回箭头，这个操作要在页面1中进行设置。
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view delegate
    /*override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("您点击了第",indexPath.section,"组，第",indexPath.row,"行")
        let menu = UIAlertController(title: "交互菜单", message: "你点击了第\(indexPath.row)行", preferredStyle: .actionSheet)
//        let option1 = UIAlertAction(title: "确定", style: .default, handler: nil)
        let option2 = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        let option3 = UIAlertAction(title: "我去过", style: .default) { (_) in
            let cell = tableView.cellForRow(at: indexPath)
            cell?.accessoryType = .checkmark
            //写为一行：
            //tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
            
            //保存选中状态
            self.visited[indexPath.row] = true

            //增加再次点击取消打钩功能，完整代码：
            /*if self.visited[indexPath.row]{
                tableView.cellForRow(at: indexPath)?.accessoryType = .none
            }else{
                let cell = tableView.cellForRow(at: indexPath)
                cell?.accessoryType = .checkmark
                //写为一行：
                //tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
                
                //保存选中状态
                self.visited[indexPath.row] = true
            }*/
        }
 
        
        //menu.addAction(option1)
        menu.addAction(option2)
        menu.addAction(option3)
        self.present(menu, animated: true, completion: nil)
        
        //弹出对话框后自动取消菜单项选中状态
        tableView.deselectRow(at: indexPath, animated: true)
    }
    */
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let actionShare = UITableViewRowAction(style: .normal, title: "分享") { (_, indexPath) in
            let actionSheet = UIAlertController(title: "分享至", message: nil, preferredStyle: .actionSheet)
            let option1 = UIAlertAction(title: "QQ", style: .default, handler: nil)
            let option2 = UIAlertAction(title: "微信", style: .default, handler: nil)
            let optionCancel = UIAlertAction(title: "取消", style: .cancel, handler: nil)
            
            actionSheet.addAction(option1)
            actionSheet.addAction(option2)
            actionSheet.addAction(optionCancel)
            
            self.present(actionSheet, animated: true, completion: nil)
        }
        actionShare.backgroundColor = UIColor.orange
        
        let actionDel = UITableViewRowAction(style: .destructive, title: "删除") { (_, indexPath) in
            /*
            self.areaImages.remove(at: indexPath.row)
            self.areas.remove(at: indexPath.row)
            self.provinces.remove(at: indexPath.row)
            self.parts.remove(at: indexPath.row)
            self.visited.remove(at: indexPath.row)
            */
            self.areas.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        let actionTop = UITableViewRowAction(style: .normal, title: "置顶") { (_, _) in
            
        }
        //actionTop.backgroundColor = UIColor(red: 245/255, green: 199/255, blue: 221/255, alpha: 1)
        
        
        return [actionDel, actionShare, actionTop]
    }
    
    
    // MARK: - Table view data source

    /*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }*/
    //这一块之前没有注释掉，导致所有内容无法显示，因为默认有一列，但这里overide返回值为0列

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return areas.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell

        // Configure the cell...
        /*
        cell.nameLabel.text = areas[indexPath.row]
        cell.thumbImageView.image = UIImage(named: areaImages[indexPath.row])
        cell.provinceLabel.text = provinces[indexPath.row]
        cell.partLabel.text = parts[indexPath.row]
        */
        cell.nameLabel.text = areas[indexPath.row].name
        cell.thumbImageView.image = UIImage(data: areas[indexPath.row].image!)
        cell.provinceLabel.text = areas[indexPath.row].province
        cell.partLabel.text = areas[indexPath.row].part
        
        cell.thumbImageView.layer.cornerRadius = cell.thumbImageView.frame.size.height / 2
        cell.thumbImageView.clipsToBounds = true
        
        //重用cell时读取状态
        if areas[indexPath.row].isVisited {
            cell.accessoryType = .checkmark
        }else{
            cell.accessoryType = .none
        }
        
        //上述if-else可简洁写为：cell.accessoryType = visited[indexPath.row] ? .checkmark : .none

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    /* 该方法默认只有一个删除按钮(功能)
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            /*
            self.areaImages.remove(at: indexPath.row)
            self.areas.remove(at: indexPath.row)
            self.provinces.remove(at: indexPath.row)
            self.parts.remove(at: indexPath.row)
            self.visited.remove(at: indexPath.row)
            */
            self.areas.remove(at: indexPath.row)
            
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
        
        if segue.identifier == "cell2detail" {
            let dest = segue.destination as! DetailTableViewController
            /*
            dest.areaImage = areaImages[tableView.indexPathForSelectedRow!.row]
            dest.areaName = areas[tableView.indexPathForSelectedRow!.row]
            dest.province = provinces[tableView.indexPathForSelectedRow!.row]
            dest.part = parts[tableView.indexPathForSelectedRow!.row]
            */
            dest.area = areas[tableView.indexPathForSelectedRow!.row]
        }
        
    }
    @IBAction func close(segue: UIStoryboardSegue){
        
    }

}
