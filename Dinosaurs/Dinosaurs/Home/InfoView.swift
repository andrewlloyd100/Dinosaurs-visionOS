//
//  InfoView.swift
//  Dinosaurs
//
//  Created by Andrew Lloyd on 28/12/2023.
//

import SwiftUI

struct InfoView: View {
    var resources: [String : String] = [
        "T-Rex (animated)" : "https://sketchfab.com/3d-models/tyrannosaurus-rex-7f7f379a88224c5c8a13abf320ed07e1",
        "T-Rex" : "https://sketchfab.com/3d-models/buck-t-rex-a2acb23a90fa4fd4be864a0e90beee8b",
        "Velociraptor (animated)" : "https://sketchfab.com/3d-models/velociraptor-2625c52cf35a4ab0a793efff2c0ac738",
        "Velociraptor" : "https://sketchfab.com/3d-models/velociraptor-jwe-73e97029aac44159b13eb9a55e1fd49f",
        "Raptor Egg" : "https://sketchfab.com/3d-models/easter-egg-2-9356e856a6af419eb97ef4a53f106603",
        "Triceratops" : "https://sketchfab.com/3d-models/triceratops-13c15e4a2eeb473cb025ab99608f3760",
        "Skeleton" : "https://sketchfab.com/3d-models/dinosaur-skeleton-printable-9803c283d60e4901b2da128e4e3fd5f8"
    ]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("3D Model Credits")
                    .font(.title3)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Spacer(minLength: 20)
                ForEach(Array(resources.keys), id: \.self) { key in
                    Text(key)
                        .font(.body)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(resources[key] ?? "")
                        .font(.caption2)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .border(.clear)
                }
                Spacer(minLength: 50)
                Text("©2023 Monstarlab")
                    .font(.caption2)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding()
        }
        .padding()
        .navigationTitle("Information")
    }
}

#Preview {
    NavigationStack {
        InfoView()
    }
}
