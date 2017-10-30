//
//  AddAeraController.swift
//  UITableViewController
//
//  Created by YXY on 2017/10/29.
//  Copyright © 2017年 YXY. All rights reserved.
//

import UIKit

class AddAeraController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    // 为从用户相册返回选取的照片，需遵从UIImagePickerControllerDelegate和UINavigationControllerDelegate协议
    // 因为模态弹出的选取照片的view带有控制器，所以需实现UINavigationControllerDelegate(以实现dismiss?)。
    @IBOutlet weak var coverImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {     // 如果选中的是第一行
            guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else{
                print("无相册权限")
                return
            }
            let picker = UIImagePickerController()
            picker.allowsEditing = false    // 不允许编辑相册
            picker.sourceType = .photoLibrary
            picker.delegate = self
            // AddAreaController为实现选取照片的具体方法需遵从UIImagePickerControllerDelegate，而实例化UIImagePickerController后，需要调用具体实际方法(而不是里面规定的抽象方法)时需要找一个遵从了UIImagePickerControllerDelegate这个协议的类。
            // 实例化后需设置代理
            
            self.present(picker, animated: true, completion: nil)   // 以模态弹出 
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    // 当用户从相册中选择了一张图，下述方法被触发；实现此方法，可从方法的参数中取回图片
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        coverImageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        coverImageView.contentMode = .scaleAspectFill
        coverImageView.clipsToBounds = true
        
        // 代码设置coverImageView布局
        let coverWidthCons = NSLayoutConstraint(
            item: coverImageView,
            attribute: .width,
            relatedBy: .equal,
            toItem: coverImageView.superview,
            attribute: .width,
            multiplier: 1,
            constant: 0)
        let coverHeightCons = NSLayoutConstraint(
            item: coverImageView,
            attribute: .height,
            relatedBy: .equal,
            toItem: coverImageView.superview,
            attribute: .height,
            multiplier: 1,
            constant: 0)
        coverWidthCons.isActive = true
        coverHeightCons.isActive = true
        
        dismiss(animated: true, completion: nil)    // 让被view controller模态弹出的VC自动退场
    }

    // MARK: - Table view data source
    // 静态数据源，删除以下两个函数
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
