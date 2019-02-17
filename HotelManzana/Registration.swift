//
//  Registration.swift
//  HotelManzana
//
//  Created by Mark Meretzky on 2/15/19.
//  Copyright © 2019 New York University School of Professional Studies. All rights reserved.
//

import Foundation;

struct Registration {
    var firstName: String;
    var lastName: String;
    var emailAddress: String;
    
    var checkInDate: Date;
    var checkOutDate: Date;
    
    var numberOfAdults: Int;
    var numberOfChildren: Int;
    
    var roomType: RoomType;
    var hasWifi: Bool;
}
