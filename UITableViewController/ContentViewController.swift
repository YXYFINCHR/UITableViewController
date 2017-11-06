//
//  ContentViewController.swift
//  UITableViewController
//
//  Created by YXY on 2017/11/1.
//  Copyright © 2017年 YXY. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {
    
    // MARK: - 组件引用及变量定义
    @IBOutlet weak var labelHeading: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelFooter: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var btnDone: UIButton!
    
    var index = 0       // 用于保存当前页索引
    var heading = ""    // 以下3各变量用于数据传递
    var imageName = ""
    var footer = ""
    
    // MARK: - App固有函数
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        labelHeading.text = heading
        imageView.image = UIImage(named: imageName)
        labelFooter.text = footer
        
        pageControl.currentPage = index
        // 只要index!=2，即不是最后一个页面，都是隐藏的
        btnDone.isHidden = (index != 2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - 组件事件
    @IBAction func doneBtnTap(_ sender: UIButton) {
        // 使用UserDefault保存参数(保存引导页展示状态)
        let defaults = UserDefaults.standard
        defaults.set(true, forKey: "guiderShowed")
        
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
