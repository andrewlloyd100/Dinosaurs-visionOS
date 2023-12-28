//
//  DinosaursApp.swift
//  Dinosaurs
//
//  Created by Andrew Lloyd on 20/12/2023.
//

import SwiftUI

@main
struct DinosaursApp: App {
    @State private var viewModel = ViewModel()
    
    @State private var triceratopsImmersionStyle: ImmersionStyle = .mixed
    @State private var raptorImmersionStyle: ImmersionStyle = .mixed
    @State private var trexImmersionStyle: ImmersionStyle = .full
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(viewModel)
        }
        .windowStyle(.plain)
        
        WindowGroup(id: RealityKitImmersionModels.raptorEgg.rawValue) {
            RaptorEggView()
                .environment(viewModel)
        }
        .windowStyle(.volumetric)
        .defaultSize(width: 0.6, height: 0.8, depth: 0.4, in: .meters)
        
        ImmersiveSpace(id: RealityKitImmersionModels.triceratops.rawValue) {
            TriceratopsImmersiveView()
                .environment(viewModel)
        }
        .immersionStyle(selection: $triceratopsImmersionStyle, in: .mixed)
        
        ImmersiveSpace(id: RealityKitImmersionModels.raptor.rawValue) {
            RaptorImmersiveView()
                .environment(viewModel)
        }
        .immersionStyle(selection: $raptorImmersionStyle, in: .mixed)
        
        ImmersiveSpace(id: RealityKitImmersionModels.trex.rawValue) {
            TrexImmersionView()
                .environment(viewModel)
        }
        .immersionStyle(selection: $trexImmersionStyle, in: .full)
    }
}
