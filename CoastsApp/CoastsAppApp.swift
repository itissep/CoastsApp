import SwiftUI

@main
struct CoastsAppApp: App {
    @State private var viewModel = ViewModel()

    var body: some Scene {
        WindowGroup("Описание", id: "description") {
            DescriptionView(viewModel: viewModel)
        }
        .defaultSize(width: 1000, height: 600)

        WindowGroup("", id: "first") {
            FirstCoastView(viewModel: viewModel)
        }
        .defaultSize(width: 600, height: 600)

        WindowGroup("", id: "second") {
            SecondCoastView(viewModel: viewModel)
        }
        .defaultSize(width: 600, height: 600)
    }
}
