//
//  PrehistoricLandscape.swift
//  Dinosaurs
//
//  Created by Andrew Lloyd on 21/12/2023.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct PrehistoricLandscape: View {
    var body: some View {
        RealityView { content in
            // Create a material with a star field on it.
            guard let resource = try? await TextureResource(named: "landscape") else {
                // If the asset isn't available, something is wrong with the app.
                fatalError("Unable to load starfield texture.")
            }
            var material = UnlitMaterial()
            material.color = .init(texture: .init(resource))

            // Attach the material to a large sphere.
            let entity = Entity()
            entity.components.set(ModelComponent(
                mesh: .generateSphere(radius: 1000),
                materials: [material]
            ))

            // Ensure the texture image points inward at the viewer.
            entity.scale *= .init(x: -1, y: 1, z: 1)
            
            guard let resource = try? await AudioFileResource(named: "/Root/JurassicParkTheme_mp3", from: "animatedTrex.usda", in: realityKitContentBundle) else {
                fatalError("Unable to load /Root/JurassicParkTheme_mp3.mp3 audio resource")
            }
            
            entity.playAudio(resource)

            content.add(entity)
        }
    }
}

#Preview {
    PrehistoricLandscape()
}
