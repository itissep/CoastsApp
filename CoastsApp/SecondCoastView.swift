import SwiftUI
import RealityKit
import UniformTypeIdentifiers
import Observation

struct SecondCoastView: View {

    var viewModel: ViewModel

    var body: some View {

        @Bindable var viewModel = viewModel

        VStack {

            Text("Другой берег")
                .font(.largeTitle)
                .monospaced()

            CharacterView(items: viewModel.rightListItems)
                .dropDestination(for: String.self) { items, location in
                    for item in items {
                        viewModel.leftListItems.removeAll { $0 == item }
                        if !viewModel.rightListItems.contains(item) {
                            viewModel.rightListItems.append(item)
                        }
                    }
                    return true
                }
        }
        .padding()
    }
}
