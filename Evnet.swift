//
//  Evnet.swift
//  MeetUpDEmo
//
//  Created by Kvana Dev Ipod on 30/12/16.
//  Copyright © 2016 Kvana DevInc. All rights reserved.
//

import Foundation

class Event{
    var name : String?
    var time : String?
    var address : String?
    var lattitude : Double?
    var longitude : Double?
    var description : String?
    init(data:[String:Any]) {
        
        self.name = data["name"] as? String
        if let address = data["venue"] as? [String:Any]{
         self.address = address["address_1"] as? String
        }
        if let lattitude = data["venue"] as? [String:Any]{
            if let longitide = data["venue"] as? [String:Any]{
                self.lattitude = lattitude["lat"] as? Double
                self.longitude = longitide["lon"] as? Double
            }
        }
        
        if let times = data["time"] as? Double{
            let date = Date(timeIntervalSince1970: times)
            let dateFormatter = DateFormatter()
            dateFormatter.locale = NSLocale(localeIdentifier: NSLocale.current.identifier) as Locale!
            dateFormatter.dateFormat = "hh:mm"
        self.time  =  dateFormatter.string(from: date)
        
    }
        self.description = data["description"] as? String
        
}
}
