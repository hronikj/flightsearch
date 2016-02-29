//
//  Flight.swift
//  SearchFlights
//
//  Created by Jiří Hroník on 27.02.16.
//  Copyright © 2016 Jiří Hroník. All rights reserved.
//

import Foundation

class Flight {
    let price: Int
    let cityTo: String
    let cityFrom: String
    let arrivalTimeUTC: NSDate
    let departureTimeUTC: NSDate
    let flyDuration: String
    let distance: Float
    let numberOfTransfers: Int
    
    init (data: NSDictionary) {
        self.price             = data["price"] as! Int
        self.cityFrom          = data["cityFrom"] as! String
        self.cityTo            = data["cityTo"] as! String
        self.arrivalTimeUTC    = NSDate(timeIntervalSince1970: data["aTimeUTC"] as! Double)
        self.departureTimeUTC  = NSDate(timeIntervalSince1970: data["dTimeUTC"] as! Double)
        self.flyDuration       = data["fly_duration"] as! String
        self.distance          = data["distance"] as! Float
        self.numberOfTransfers = data["route"]!.count
    }
    
    
}