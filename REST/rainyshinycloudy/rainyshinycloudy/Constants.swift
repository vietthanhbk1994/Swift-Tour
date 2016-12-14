//
//  File.swift
//  rainyshinycloudy
//
//  Created by Thanh on 12/13/16.
//  Copyright © 2016 Thanh. All rights reserved.
//

import Foundation

typealias DownloadComplelte = () -> ()

let CURRENT_WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather?lat=\(Location.shareinstance.latitude!)&lon=\(Location.shareinstance.longitude!)&appid=6167be2faa4be1a9cc275528a1515bcd"

let FORECAST_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=\(Location.shareinstance.latitude!)&lon=\(Location.shareinstance.longitude!)&cnt=10&mode=json&appid=6167be2faa4be1a9cc275528a1515bcd"


