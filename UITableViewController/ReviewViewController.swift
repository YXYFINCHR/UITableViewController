//
//  ReviewViewController.swift
//  UITableViewController
//
//  Created by YXY on 2017/10/24.
//  Copyright © 2017年 YXY. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {
    
    var rating: String?

    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var ratingStackView: UIStackView!
    @IBAction func ratingTap(_ sender: UIButton) {
        switch sender.tag {
        case 100:
            rating = "dislike"
        case 101:
            rating = "good"
        case 102:
            rating = "great"
        default:
            break
        }
        performSegue(withIdentifier: "unwindToDetailView", sender: self)
    }
    
    override func viewDidLoad() {   //只载入一次
        super.viewDidLoad()

        //let effect = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        //对背景图片添加虚化特效
        let effect = UIBlurEffect(style: .light)
        let effectView = UIVisualEffectView(effect: effect)
        effectView.frame = view.frame
        bgImageView.addSubview(effectView)
        
        //初始帧大小为0
        //ratingStackView.transform = CGAffineTransform(scaleX: 0, y: 0)
        let startScale = CGAffineTransform(scaleX: 0, y: 0)
        //起始位置为屏幕下方500个点处
        let startPos = CGAffineTransform(translationX: 0, y: 500)
        
        ratingStackView.transform = startScale.concatenating(startPos)
        
    }
    
    override func viewDidAppear(_ animated: Bool) { //视图每一次显示完毕
        UIView.animate(withDuration: 0.3) {
            //self.ratingStackView.transform = CGAffineTransform.identity
            let endPos = CGAffineTransform(translationX: 0, y: 0)
            let endScale = CGAffineTransform.identity
            
            self.ratingStackView.transform = endScale.concatenating(endPos)
        }
        /*UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: [], animations: {
            let endPos = CGAffineTransform(translationX: 0, y: 0)
            let endScale = CGAffineTransform.identity
            
            self.ratingStackView.transform = endScale.concatenating(endPos)
        }, completion: nil)*/
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
