import SwiftUI
import RealityKit
import UniformTypeIdentifiers
import Observation

struct FirstCoastView: View {

    var viewModel: ViewModel

    var body: some View {

        @Bindable var viewModel = viewModel

        VStack {
            Text("Один берег")
                .font(.largeTitle)
                .monospaced()
            CharacterView(items: viewModel.leftListItems)
                .dropDestination(for: String.self) { items, location in
                    for item in items {
                        viewModel.rightListItems.removeAll { $0 == item }
                        if !viewModel.leftListItems.contains(item) {
                            viewModel.leftListItems.append(item)
                        }
                    }
                    return true
                }
        }
        .padding()
    }
}
