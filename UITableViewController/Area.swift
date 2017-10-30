//
//  Area.swift
//  UITableViewController
//
//  Created by YXY on 2017/10/22.
//  Copyright © 2017年 YXY. All rights reserved.
//

struct Area {
    var name: String
    var province: String
    var part: String
    var image: String
    var isVisited: Bool
    var rating = ""
    
    
    init(name: String, province: String, part: String, image: String, isVisited: Bool){
        self.name = name
        self.province = province
        self.part = part
        self.image = image
        self.isVisited = isVisited
    }
    
}


