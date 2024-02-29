//
//  Landmarz.swift
//  Landmarks
//
//  Created by I Made Indra Mahaarta on 29/02/24.
//

import Foundation
import SwiftUI
import CoreLocation

struct Landmark: Hashable, Codable, Identifiable {
    var id: Int;
    var name: String;
    var park: String;
    var state: String;
    var description: String;
    var isFavorite: Bool;
    var isFeatured: Bool
        
    var category: Category
    enum Category: String, CaseIterable, Codable {
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    private var coordinates: Coordinate
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }
    
    
    struct Coordinate: Hashable, Codable {
        var latitude: Double;
        var longitude: Double;
    }
}


