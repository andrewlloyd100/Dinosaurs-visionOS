import RealityKit
import SwiftUI

extension Entity {
  /// Adds an image-based light.
  ///
  /// This method assumes that the project contains a folder called
  /// `Environment.skybox`
  ///
  /// Tune the intensity parameter to get the brightness that you need.
  /// Set the intensity to `nil` to remove the image-based light (IBL)
  /// from the entity.
  ///
  /// - Parameter intensity: The strength of the sunlight. Tune
  ///   this value to get the brightness you want. Set a value of `nil` to
  ///   remove the image based light from the entity.
  ///
  /// - Parameter inheritsRotation: Ensure that the light rotates with its entity.
  /// Set to false for a light that remains fixed relative to the surroundings.
  func setLight(intensity: Float?, inheritsRotation: Bool = true) {
    if let intensity {
      Task {
        guard let resource = try? await EnvironmentResource(named: "Environment") else { return }
        var iblComponent = ImageBasedLightComponent(
          source: .single(resource),
          intensityExponent: intensity
        )
        
        iblComponent.inheritsRotation = inheritsRotation
        
        components.set(iblComponent)
        components.set(ImageBasedLightReceiverComponent(imageBasedLight: self))
      }
    } else {
      components.remove(ImageBasedLightComponent.self)
      components.remove(ImageBasedLightReceiverComponent.self)
    }
  }
}
