//
//  TriceratopsImmersiveView.swift
//  Dinosaurs
//
//  Created by Andrew Lloyd on 20/12/2023.
//

import SwiftUI
import RealityKit
import RealityKitContent
import Combine

struct TriceratopsImmersiveView: View {
    @Environment(ViewModel.self) private var viewModel
    
    @State private var dino: Entity? = nil
    @State private var roarAnimation: AnimationResource? = nil
    
    let tapSubject = PassthroughSubject<Void, Never>()
    @State var cancellable: AnyCancellable?
    
    var body: some View {
        RealityView { content in
            do {
                // Create an earth entity with tilt, rotation, a moon, and so on.
                let dinoEntity = try await Entity(named: RealityKitImmersionModels.triceratops.rawValue, in: realityKitContentBundle)
                content.add(dinoEntity)

                for anim in dinoEntity.availableAnimations {
                    dinoEntity.playAnimation(anim.repeat(duration: .infinity), startsPaused: false)
                }

                // Store for later updates.
                self.dino = dinoEntity
                self.roarAnimation = roarAnimation
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
            viewModel.isShowingTriceratops = false
        }
    }
}

#Preview {
    TriceratopsImmersiveView()
}
