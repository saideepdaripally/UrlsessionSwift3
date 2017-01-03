//
//  EventDetailViewController.swift
//  MeetUpDEmo
//
//  Created by Kvana Dev Ipod on 30/12/16.
//  Copyright © 2016 Kvana DevInc. All rights reserved.
//

import UIKit
import MapKit

class EventDetailViewController: UIViewController,MKMapViewDelegate {

    var event:Event?
    
    @IBOutlet weak var eventMapView: MKMapView!
   
    @IBOutlet weak var detailEventAddress: UILabel!

    @IBOutlet weak var descriptionView: UIWebView!
   
    @IBOutlet weak var detailEventName: UILabel!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        eventMapView.delegate = self
        setGradientBackground()
       if let lati = event?.lattitude , let longi = event?.longitude{
        
        let span = MKCoordinateSpanMake(0.10, 0.10)
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: lati,longitude: longi), span: span)
        eventMapView.setRegion(region, animated: true)
        let dropPin = MKPointAnnotation()
        dropPin.coordinate = region.center
        dropPin.title = "event"
        eventMapView.addAnnotation(dropPin)
        }
        detailEventName.text = event?.name
        detailEventAddress.text = event?.address
       descriptionView.loadHTMLString((event?.description)!, baseURL: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setGradientBackground() {
        let colorTop =  UIColor(red: 255.0/255.0, green: 149.0/255.0, blue: 0.0/255.0, alpha: 0.5).cgColor
        let colorBottom = UIColor(red: 255.0/255.0, green: 94.0/255.0, blue: 58.0/255.0, alpha: 0.5).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [ colorTop, colorBottom]
        gradientLayer.locations = [ 0.0, 1.0]
        gradientLayer.frame = self.view.bounds
        eventMapView.layer.addSublayer(gradientLayer)
    }
    

}
