//
//  Friend.swift
//  FriendsGiving
//
//  Created by Eric on 05/05/2023.
//

import Foundation

struct Friend: Codable, Identifiable {
    var id: String?
    var name = ""
    var bringing = ""
    var notes = ""
    
    static let example = Friend(name: "Eric", bringing: "Barbecue Chips", notes: "Go to swiming Pool")
}
