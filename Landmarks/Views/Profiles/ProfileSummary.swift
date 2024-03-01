//
//  ProfileSummary.swift
//  Landmarks
//
//  Created by I Made Indra Mahaarta on 02/03/24.
//

import SwiftUI

struct ProfileSummary: View {
    @Environment(ModelData.self) var modelData
    var profile: Profile
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 10, content: {
                Text(profile.username)
                    .font(.title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Text("Prefers Notifications: \(profile.prefersNotifications  ? "On" : "Off")")
                Text("Seasonal Photo: \(profile.seasonalPhoto.rawValue)")
                Text("Goal Date: ") + Text(profile.goalDate, style: .date)
                
                Divider()
                
                VStack (alignment: .leading) {
                    Text("Complete Badge")
                        .font(.headline)
                    ScrollView(.horizontal) {
                        HStack {
                            HikeBadge(name: "First Hike")
                            HikeBadge(name: "Earth Day")
                                .hueRotation(Angle(degrees: 90))
                            HikeBadge(name: "Tenth Hike")
                                .grayscale(0.5)
                                .hueRotation(Angle(degrees: 45))
                        }
                        .padding(.bottom)
                    }
                }
                
                Divider()
                
                VStack(alignment: .leading) {
                    Text("Recent Hikes")
                        .font(.headline)
                    HikeView(hike: modelData.hikes[0])
                }
            })
        }
    }
}

#Preview {
    let modelData = ModelData()
    return ProfileSummary(profile: Profile.default).environment(modelData)
}
