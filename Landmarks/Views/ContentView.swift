//
//  ContentView.swift
//  Landmarks
//
//  Created by I Made Indra Mahaarta on 29/02/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

#Preview {
    ContentView().environment(ModelData())
}
