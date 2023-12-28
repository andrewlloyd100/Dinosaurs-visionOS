import SwiftUI
import RealityKit
import RealityKitContent

struct RaptorEggView: View {
    @Environment(ViewModel.self) private var viewModel
    @State private var entity: Entity?
    
    @State private var isLightOn = false
    @State var intensity: Float = 0

    var body: some View {
        ZStack(alignment: .bottom) {
            RealityView { content in
                // Create an earth entity with tilt, rotation, a moon, and so on.
                let entity = try! await Entity(named: RealityKitImmersionModels.raptorEgg.rawValue, in: realityKitContentBundle)
                content.add(entity)
                
                for anim in entity.availableAnimations {
                    entity.playAnimation(anim.repeat(duration: .infinity), startsPaused: false)
                }

                // Store for later updates.
                self.entity = entity
            } update: { content in
                if let scene = content.entities.first {
                  scene.setLight(intensity: intensity, inheritsRotation: false)
                }
            }
            .offset(y: -50)
            .onDisappear {
                viewModel.isShowingRaptorEgg = false
            }
            
            HStack(spacing: 17) {
                Toggle(isOn: $isLightOn) {
                    Image(systemName: "sun.max")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 60, height: 60)
                }
            }
            .toggleStyle(.button)
            .buttonStyle(.borderless)
            .padding(20)
            .glassBackgroundEffect(in: .rect(cornerRadius: 40))
            .accessibilitySortPriority(2)
        }
        .onChange(of: isLightOn) { _, isOn in
          self.intensity = isOn ? 1 : 0
        }
    }
}

#Preview {
    RaptorEggView()
        .environment(ViewModel())
}
