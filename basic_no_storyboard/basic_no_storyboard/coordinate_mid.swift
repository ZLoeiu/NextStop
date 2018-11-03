//
//  coordinate_mid.swift
//  basic_no_storyboard
//
//  Created by Candace Chiang on 11/3/18.
//  Copyright © 2018 Candace Chiang. All rights reserved.
//

import Foundation
import CoreLocation

extension CLLocationCoordinate2D {
    // MARK: CLLocationCoordinate2D+MidPoint
    func middleLocationWith(location:CLLocationCoordinate2D) -> CLLocationCoordinate2D {
        
        let lon1 = longitude * M_PI / 180
        let lon2 = location.longitude * M_PI / 180
        let lat1 = latitude * M_PI / 180
        let lat2 = location.latitude * M_PI / 180
        let dLon = lon2 - lon1
        let x = cos(lat2) * cos(dLon)
        let y = cos(lat2) * sin(dLon)
        
        let lat3 = atan2( sin(lat1) + sin(lat2), sqrt((cos(lat1) + x) * (cos(lat1) + x) + y * y) )
        let lon3 = lon1 + atan2(y, cos(lat1) + x)
        
        let center:CLLocationCoordinate2D = CLLocationCoordinate2DMake(lat3 * 180 / M_PI, lon3 * 180 / M_PI)
        return center
    }
}
