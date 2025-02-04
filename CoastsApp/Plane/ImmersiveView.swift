import SwiftUI
import RealityKit
import RealityKitContent

struct ImmersiveView: View {
    @State var contentEntity = Entity()
    @State var plane = Entity()

    var body: some View {
        RealityView { content in
            content.add(setupContentEntity())

            plane = await loadPlane(at: SIMD3(x: 0, y: 1, z: -1))
        }
    }

    func setupContentEntity() -> Entity {
        contentEntity
    }

    func getTargetEntity(name: String) -> Entity? {
        contentEntity.children.first { $0.name == name}
    }

    @MainActor
    func loadPlane(at position: SIMD3<Float>) async -> Entity {
        let entity = try! await Entity(named: "toy_biplane_idle", in: realityKitContentBundle)

        entity.position = position
        contentEntity.addChild(entity)

        if let animation = entity.availableAnimations.first?.repeat() {
            entity.playAnimation(animation)
        }

        return entity
    }
}
