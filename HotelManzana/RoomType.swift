//
//  RoomType.swift
//  HotelManzana
//
//  Created by Mark Meretzky on 2/15/19.
//  Copyright © 2019 New York University School of Professional Studies. All rights reserved.
//

import Foundation;

struct RoomType {   //p. 706
    var id: Int;
    var name: String;
    var shortName: String;
    var price: Double;
    
    static var all: [RoomType] {   //p. 706
        return [
            RoomType(id: 0, name: "Two Queens",      shortName: "2Q",  price: 179.00),
            RoomType(id: 1, name: "One King",        shortName: "K",   price: 209.00),
            RoomType(id: 2, name: "Penthouse Suite", shortName: "PHS", price: 309.00)
        ];
    }
}
