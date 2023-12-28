//
//  RaptorEggToggle.swift
//  Dinosaurs
//
//  Created by Andrew Lloyd on 21/12/2023.
//

import SwiftUI

struct RaptorEggToggle: View {
    @Environment(ViewModel.self) private var model
    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismissWindow) private var dismissWindow

    var body: some View {
        @Bindable var model = model

        Toggle(Module.velociraptor.callToAction, isOn: $model.isShowingRaptorEgg)
            .onChange(of: model.isShowingRaptorEgg) { _, isShowing in
                if isShowing {
                    openWindow(id: RealityKitImmersionModels.raptorEgg.rawValue)
                } else {
                    dismissWindow(id: RealityKitImmersionModels.raptorEgg.rawValue)
                }
            }
            .toggleStyle(.button)
    }
}

#Preview {
    RaptorEggToggle()
        .environment(ViewModel())
}
