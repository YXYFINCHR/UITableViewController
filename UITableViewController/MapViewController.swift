//
//  MapViewController.swift
//  UITableViewController
//
//  Created by YXY on 2017/10/29.
//  Copyright © 2017年 YXY. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {
    var area:Area!
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.showsCompass = true
        mapView.showsScale = true
        mapView.showsTraffic = true
        mapView.showsUserLocation = true
        mapView.showsBuildings = true

        let coder = CLGeocoder()
        coder.geocodeAddressString(area.name) { (ps, error) in
            guard let pos = ps else{
                print(error ?? "位置处错误")
                return
            }
            
            let place = pos.first
            let annotation = MKPointAnnotation()
            annotation.title = self.area.name
            annotation.subtitle = self.area.province
            
            if let loc = place?.location{
                annotation.coordinate = loc.coordinate
                self.mapView.showAnnotations([annotation], animated: true)
                self.mapView.selectAnnotation(annotation, animated: true)
            }
            
        }
        
    }
    
    // 自定义Annotation View
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation{    //忽略左下角点击定位后的用户位置
            return nil
        }
        
        let id = "myid"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: id) as? MKPinAnnotationView
        
        if annotationView == nil {          //如果重用不成功，即没有一个初始化(或用过)的annotationView
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: id)
            annotationView?.canShowCallout = true   //在呼出的气泡中是否可以展示其他信息
        }
        
        let leftIconView = UIImageView(frame: CGRect(x: 0, y: 0, width: 53, height: 53))
        leftIconView.image = UIImage(named: area.image)
        annotationView?.leftCalloutAccessoryView = leftIconView
        
        //annotationView?.pinTintColor = .green
        
        return annotationView
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
