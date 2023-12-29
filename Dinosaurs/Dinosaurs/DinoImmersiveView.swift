//
//  DinoImmersiveView.swift
//  Dinosaurs
//
//  Created by Andrew Lloyd on 28/12/2023.
//

import SwiftUI
import RealityKit
import RealityKitContent
import Combine

struct DinoImmersiveView: View {
    let immersionModel: RealityKitImmersionModels
    
    @Environment(ViewModel.self) private var viewModel
    
    @State private var dino: Entity? = nil
    
    var body: some View {
        RealityView { content in
            do {
                // Create an earth entity with tilt, rotation, a moon, and so on.
                let dinoEntity = try await Entity(named: immersionModel.rawValue, in: realityKitContentBundle)
                content.add(dinoEntity)

                for anim in dinoEntity.availableAnimations {
                    dinoEntity.playAnimation(anim.repeat(duration: .infinity), startsPaused: false)
                }

                dinoEntity.setLight(intensity: 1.0, inheritsRotation: false)
                self.dino = dinoEntity
            }
            catch{
                print("Error in RealityView's make: \(error)")
            }
        }
        .placementGestures(
            initialPosition: Point3D([-2000, 680, -5000.0]),
            axZoomIn: false,
            axZoomOut: false)
        .onDisappear {
            viewModel.isShowingRaptor = false
        }
    }
}

#Preview {
    DinoImmersiveView(immersionModel: .raptor)
}
