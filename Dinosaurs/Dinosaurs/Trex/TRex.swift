//
//  TRex.swift
//  Dinosaurs
//
//  Created by Andrew Lloyd on 21/12/2023.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct TRex: View {
    var scale: Float = 1
    var position: SIMD3<Float> = .zero

    /// The sun entity that the view creates and stores for later updates.
    @State private var trex: Entity?

    var body: some View {
        RealityView { content in
            do {
                let trex = try await Entity(named: RealityKitImmersionModels.animatedTrex.rawValue, in: realityKitContentBundle)
                content.add(trex)
                
                for anim in trex.availableAnimations {
                    trex.playAnimation(anim.repeat(duration: .infinity), startsPaused: false)
                }
                
                trex.setLight(intensity: 1.0, inheritsRotation: false)
                self.trex = trex
            }
            catch {
                print("Error in RealityView's make: \(error)")
            }
        }
        .placementGestures(
            initialPosition: Point3D([-2000, 0, -3000.0]),
            axZoomIn: false,
            axZoomOut: false)
    }
}

#Preview {
    TRex()
}
