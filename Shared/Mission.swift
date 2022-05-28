//
//  Mission.swift
//  Moonshot
//
//  Created by Luthfi Khan on 28/05/22.
//

import Foundation

struct Mission: Codable, Identifiable{
    struct CrewRole: Codable{
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var imageString: String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String{
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
}
