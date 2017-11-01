//
//  GuideViewController.swift
//  UITableViewController
//
//  Created by YXY on 2017/11/1.
//  Copyright © 2017年 YXY. All rights reserved.
//

import UIKit

class GuideViewController: UIPageViewController, UIPageViewControllerDataSource {

    // MARK: - 定义变量(数据源)
    var headings = ["Swift 4", "iOS 10", "零基础"]
    var images = ["Swift", "iOS", "Beginer"]
    var footers = ["Swift 4语法适配，the latest release", "iOS 10版本特性，马上学习", "无需预备知识，轻松入门"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // 设置翻页控制器的数据源
        dataSource = self
        // 创建并设置第一个页面控制器(起始页面)
        if let startVC = vc(atIndex: 0) {
            setViewControllers([startVC], direction: .forward, animated: true, completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - 实现系统提供的(Protocol要求的)功能函数
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {       // 左滑-当前控制器要去左边
        var index = (viewController as! ContentViewController).index
        index -= 1
        
        return vc(atIndex: index)   // 返回右边(下一个)控制器
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! ContentViewController).index
        index += 1
        
        return vc(atIndex: index)   // 返回左边(上一个)控制器
    }
    
    // MARK: - 自定义函数
    func vc(atIndex: Int) -> ContentViewController? {
        if case 0..<headings.count = atIndex {
            if let contentVC = storyboard?.instantiateViewController(withIdentifier: "ContentController") as? ContentViewController {   // 使用此方法初始化一个有storyboard ID的控制器，如果初始化成功则传递相应数据
                contentVC.heading = headings[atIndex]
                contentVC.imageName = images[atIndex]
                contentVC.footer = footers[atIndex]
                contentVC.index = atIndex
                
                return contentVC
            }
        }
        return nil
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
