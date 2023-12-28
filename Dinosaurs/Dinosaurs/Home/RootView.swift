//
//  RootView.swift
//  Dinosaurs
//
//  Created by Andrew Lloyd on 20/12/2023.
//

import SwiftUI

struct RootView: View {
    @Environment(ViewModel.self) private var model
    @Environment(\.dismissWindow) private var dismissWindow
    @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace
    
    var body: some View {
        @Bindable var model = model
        
        NavigationStack(path: $model.navigationPath) {
            HomeView()
                .navigationDestination(for: NavigationDestination.self) { destination in
                    switch destination {
                    case .info:
                        InfoView()
                    case .triceratops:
                        let module = Module.triceratops
                        ModuleDetail(module: module)
                            .navigationTitle(module.name)
                    case .tyrannosaurus:
                        let module = Module.tyrannosaurus
                        ModuleDetail(module: module)
                            .navigationTitle(module.name)
                    case .velociraptor:
                        let module = Module.velociraptor
                        ModuleDetail(module: module)
                            .navigationTitle(module.name)
                        
                    }
                }
        }
        // Close any open detail view when returning to the table of contents.
        .onChange(of: model.navigationPath) { _, path in
            if path.isEmpty {
                if model.isShowingRaptorEgg {
                    dismissWindow(id: RealityKitImmersionModels.raptorEgg.rawValue)
                }
                if model.isShowingRaptor || model.isShowingTriceratops {
                    Task {
                        await dismissImmersiveSpace()
                    }
                }
            }
        }
    }
}

#Preview {
    RootView()
}
