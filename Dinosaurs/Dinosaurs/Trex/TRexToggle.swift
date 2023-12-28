//
//  TRexToggle.swift
//  Dinosaurs
//
//  Created by Andrew Lloyd on 21/12/2023.
//

import SwiftUI

struct TRexToggle: View {
    @Environment(ViewModel.self) private var model
    @Environment(\.openImmersiveSpace) private var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace

    var body: some View {
        Button {
            Task {
                if model.isShowingTRex {
                    await dismissImmersiveSpace()
                } else {
                    await openImmersiveSpace(id: RealityKitImmersionModels.trex.rawValue)
                }
            }
        } label: {
            if model.isShowingTRex {
                Label(
                    "Exit the Prehistoric age",
                    systemImage: "arrow.down.right.and.arrow.up.left")
            } else {
                Text(Module.tyrannosaurus.callToAction)
            }
        }
    }
}

#Preview {
    TRexToggle()
}
