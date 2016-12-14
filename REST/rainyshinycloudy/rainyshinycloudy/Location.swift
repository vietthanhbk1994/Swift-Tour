//
//  Location.swift
//  rainyshinycloudy
//
//  Created by Thanh on 12/14/16.
//  Copyright © 2016 Thanh. All rights reserved.
//

import CoreLocation

class Location {
    static var shareinstance = Location()
    private init() {}
    
    var latitude: Double!
    var longitude: Double!
}
