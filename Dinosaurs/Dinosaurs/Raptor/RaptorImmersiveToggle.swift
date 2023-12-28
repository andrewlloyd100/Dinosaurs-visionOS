//
//  RaptorImmersiveToggle.swift
//  Dinosaurs
//
//  Created by Andrew Lloyd on 21/12/2023.
//

import SwiftUI
import RealityKit
import RealityKitContent
import Combine

struct RaptorImmersiveToggle: View {
    @Environment(ViewModel.self) private var model
    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
    
    var body: some View {
        @Bindable var model = model
        
        Toggle("Invite a raptor into your room", isOn: $model.isShowingRaptor)
            .onChange(of: model.isShowingRaptor) { _, isShowing in
                Task {
                    if isShowing {
                        await openImmersiveSpace(id: RealityKitImmersionModels.raptor.rawValue)
                    } else {
                        await dismissImmersiveSpace()
                    }
                }
            }
            .toggleStyle(.button)
    }
}

#Preview {
    RaptorImmersiveToggle()
}
