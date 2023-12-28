/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
A detail view that presents information about different module types.
*/

import SwiftUI
import RealityKit
import RealityKitContent

/// A detail view that presents information about different module types.
struct ModuleDetail: View {
    @Environment(ViewModel.self) private var model

    var module: Module
    private let padding: CGFloat = 70.0
    
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
    
    var body: some View {
        @Bindable var model = model

        GeometryReader { proxy in
            let availableWidth = proxy.size.width - (padding * 3)
            ZStack {
                HStack(spacing: padding) {
                    VStack(alignment: .leading, spacing: 0) {
                        Text(module.heading)
                            .font(.system(size: 50, weight: .bold))
                            .padding(.bottom, 15)
                            .accessibilitySortPriority(4)

                        Text(module.body)
                            .accessibilitySortPriority(3)

                        Spacer()
                        
                        switch module {
                        case .velociraptor:
                            HStack {
                                RaptorEggToggle()
                                RaptorImmersiveToggle()
                            }
                            
                        case .triceratops:
                            TriceratopsToggle()
                        case .tyrannosaurus:
                            TRexToggle()
                        }
                        
                        Spacer()
                    }
                    .frame(maxWidth: 600, alignment: .leading)
                    module.detailView
                        .frame(width: 400, alignment: .center)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .padding(padding)
        .onDisappear() {
            Task {
                if model.isShowingRaptor || model.isShowingTriceratops {
                    await dismissImmersiveSpace()
                    
                }
            }
        }
   }
}

extension Module {
    @ViewBuilder
    fileprivate var detailView: some View {
        VStack {
            Model3D(named: self.modelName, bundle: realityKitContentBundle) { model in
                model
                    .resizable()
                    .scaledToFit()
                    .frame(depth: 500)
                    .accessibilitySortPriority(1)
            } placeholder: {
                ProgressView()
                    .offset(z: -200 * 0.75)
            }
            .frame(maxHeight: 200)
            .dragRotation(yawLimit: .degrees(120), pitchLimit: .degrees(120))
        }
    }
}

#Preview("tyrannosaurus") {
    NavigationStack {
        ModuleDetail(module: .tyrannosaurus)
            .environment(ViewModel())
    }
}

#Preview("velociraptor") {
    NavigationStack {
        ModuleDetail(module: .velociraptor)
            .environment(ViewModel())
    }
}

#Preview("triceratorps") {
    NavigationStack {
        ModuleDetail(module: .triceratops)
            .environment(ViewModel())
    }
}
