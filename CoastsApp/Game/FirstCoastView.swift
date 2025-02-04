import SwiftUI
import UniformTypeIdentifiers
import Observation

struct FirstCoastView: View {

    var gameService: GameService

    var body: some View {

        @Bindable var gameService = gameService

        VStack {
            Text("Один берег")
                .font(.largeTitle)
                .monospaced()
            CharacterView(items: gameService.leftListItems)
                .dropDestination(for: String.self) { items, location in
                    for item in items {
                        gameService.rightListItems.removeAll { $0 == item }
                        if !gameService.leftListItems.contains(item) {
                            gameService.leftListItems.append(item)
                        }
                    }
                    return true
                }
        }
        .padding()
    }
}
