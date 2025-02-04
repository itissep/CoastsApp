import SwiftUI
import RealityKit
import UniformTypeIdentifiers
import Observation

struct SecondCoastView: View {

    var gameService: GameService

    var body: some View {

        @Bindable var gameService = gameService

        VStack {

            Text("Другой берег")
                .font(.largeTitle)
                .monospaced()

            CharacterView(items: gameService.rightListItems)
                .dropDestination(for: String.self) { items, location in
                    for item in items {
                        gameService.leftListItems.removeAll { $0 == item }
                        if !gameService.rightListItems.contains(item) {
                            gameService.rightListItems.append(item)
                        }
                    }
                    return true
                }
        }
        .padding()
    }
}
