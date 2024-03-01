//
//  Profile.swift
//  Landmarks
//
//  Created by I Made Indra Mahaarta on 02/03/24.
//

import Foundation

struct Profile {
    var username: String;
    var prefersNotifications: Bool = true;
    var seasonalPhoto = Season.winter
    var goalDate = Date()
    
    static let `default` = Profile(username: "indra")
    
    enum Season: String, CaseIterable, Identifiable {
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"


        var id: String { rawValue }
    }
}
