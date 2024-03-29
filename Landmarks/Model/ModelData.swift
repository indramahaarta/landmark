//
//  ModelData.swift
//  Landmarks
//
//  Created by I Made Indra Mahaarta on 29/02/24.
//

import Foundation

@Observable
class ModelData {
    var profile = Profile.default
    var landmarks: [Landmark] = load("landmarkData.json")
    var categories: [String: [Landmark]] {
        Dictionary(grouping: landmarks, by: {$0.category.rawValue})
    }
    var hikes: [Hike] = load("hikeData.json")
    var features: [Landmark] {
        landmarks.filter { landmark in
            landmark.isFeatured
        }
    }
}


func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Could not find \(filename) in main.bundle")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Could not load \(filename) in main.bundle")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Coudn't parse \(filename) s \(T.self):\n\(error)")
    }
}
