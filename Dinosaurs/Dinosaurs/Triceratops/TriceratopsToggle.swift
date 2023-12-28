//
//  TriceratopsToggle.swift
//  Dinosaurs
//
//  Created by Andrew Lloyd on 21/12/2023.
//

import SwiftUI

struct TriceratopsToggle: View {
    @Environment(ViewModel.self) private var model
    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
    
    var body: some View {
        @Bindable var model = model
        
        Toggle(Module.triceratops.callToAction, isOn: $model.isShowingTriceratops)
            .onChange(of: model.isShowingTriceratops) { _, isShowing in
                Task {
                    if isShowing {
                        await openImmersiveSpace(id: RealityKitImmersionModels.triceratops.rawValue)
                    } else {
                        await dismissImmersiveSpace()
                    }
                }
            }
            .toggleStyle(.button)
    }
}

#Preview {
    TriceratopsToggle()
}
