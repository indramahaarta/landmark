//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by I Made Indra Mahaarta on 29/02/24.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @State private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environment(modelData)
        }
    }
}
