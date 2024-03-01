//
//  CategoryHome.swift
//  Landmarks
//
//  Created by I Made Indra Mahaarta on 01/03/24.
//

import SwiftUI

struct CategoryHome: View {
    @Environment(ModelData.self) var modelData
    @State private var showProfile = false
    
    var body: some View {
        NavigationSplitView {
            List {
                modelData.features[0].image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, listItems: modelData.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
            .listStyle(.inset)
                .navigationTitle("Featured")
                .toolbar {
                    Button {
                        showProfile.toggle()
                    } label: {
                        Label("User Profile", systemImage: "person.crop.circle")
                    }
                }
                .sheet(isPresented: $showProfile, content: {
                    ProfileHost().environment(modelData)
                })
        } detail: {
            Text("Select a landmark")
        }
    }
}

#Preview {
    CategoryHome().environment(ModelData())
}
