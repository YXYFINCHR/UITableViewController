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

//Area(name: "闵行区莘庄镇疏影路711弄东苑新天地21号405", province: "上海", part: "华东", image: "xinzhuang", isVisited: false),
//Area(name: "兰州七里河区彭家坪路36号兰州理工大学西校区计算机系", province: "甘肃", part: "西北", image: "qilihe", isVisited: false),
//Area(name: "三明市尤溪县东旭家园83号楼", province: "福建", part: "东南", image: "youxi", isVisited: false),
//Area(name: "西宁城西区香格里拉路昆仑阳光城5号楼，近新华巷", province: "青海", part: "西北", image: "chengxi", isVisited: false),
//Area(name: "广州白云区黄石东路江夏东二街200号(地铁2号线江夏站C出口往右约200米)欧陆公馆", province: "广东", part: "华南", image: "baiyun", isVisited: false),
//Area(name: "闽侯县上街镇工贸路惠好路福禄坊", province: "福建", part: "东南", image: "shangjie", isVisited: false),
//Area(name: "哈尔滨市南岗区嵩山路125号中植方洲苑1102", province: "黑龙江", part: "东北", image: "nangang", isVisited: false),
//Area(name: "临汾市尧渡区解放东路与尧贤路交汇处恒安新东城逸景40栋3001", province: "山西", part: "华北", image: "yaodu", isVisited: false),
//Area(name: "成都武侯区丽都路2号置信丽都花园15号1004", province: "四川", part: "西南", image: "wuhou", isVisited: false),
//Area(name: "汕头市金平区汕樟路16号(中山路与汕樟路转角)凯悦华庭3号楼805", province: "广东", part: "华南", image: "jinping", isVisited: false),
//Area(name: "长沙市芙蓉区车站北路225号丽园西区9号楼1311", province: "湖南", part: "华中", image: "furong", isVisited: false)


