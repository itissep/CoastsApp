import SwiftUI

@main
struct CoastsAppApp: App {
    @State private var gameService = GameService()
    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismissWindow) private var dismissWindow

    @State var isGame: Bool = false
    @State var isPlane: Bool = false


    var body: some Scene {

        WindowGroup("Описание", id: "main") {
            VStack {
                HStack {
                    Button("Игра") {
                        if !isGame {
                            dismissWindow(id: "content")
                            isPlane = false

                            openWindow(id: "description")
                            openWindow(id: "second")
                            openWindow(id: "first")
                            isGame = true
                        }
                    }

                    Button("Самолетик") {
                        if !isPlane {
                            dismissWindow(id: "description")
                            dismissWindow(id: "second")
                            dismissWindow(id: "first")
                            isGame = false

                            openWindow(id: "content")
                            isPlane = true
                        }
                    }
                }.padding(.bottom)
                if isGame {
                    VStack {
                        Text("P.S. Это пародия на головоломку с переправой")
                        Text("Перетаскивайте собаку, зайца или морковку")
                        Text("Играть нужно быстро и, желательно, не ошибаться :)")
                            .padding(.bottom)
                        Text("Лучше перетащить \"берега\" ближе друг к другу")
                    }
                    .font(.headline)
                    .monospaced()
                }
                if isPlane {
                    Text("Тут просто показывается и пропадает самолетик :)")
                        .font(.headline)
                        .monospaced()
                }
            }
        }

        WindowGroup("Описание", id: "description") {
            DescriptionView(gameService: gameService)
        }
        .defaultSize(width: 1000, height: 600)
        .defaultWindowPlacement { content, context in
            if let lastWindow = context.windows.last {
                WindowPlacement(.below(lastWindow))
            } else {
                WindowPlacement(.utilityPanel)
            }
        }

        WindowGroup(id: "content") {
            PlaneButtonView()
        }
        .defaultSize(width: 1000, height: 600)
        .defaultWindowPlacement { content, context in
            if let lastWindow = context.windows.last {
                WindowPlacement(.below(lastWindow))
            } else {
                WindowPlacement(.utilityPanel)
            }
        }


        WindowGroup("", id: "first") {
            FirstCoastView(gameService: gameService)
        }
        .defaultSize(width: 600, height: 600)
        .defaultWindowPlacement { content, context in
            if let lastWindow = context.windows.last {
                WindowPlacement(.leading(lastWindow))
            } else {
                WindowPlacement(.utilityPanel)
            }
        }


        WindowGroup("", id: "second") {
            SecondCoastView(gameService: gameService)
        }
        .defaultSize(width: 600, height: 600)
        .defaultWindowPlacement { content, context in
            if let lastWindow = context.windows.last {
                WindowPlacement(.trailing(lastWindow))
            } else {
                WindowPlacement(.utilityPanel)
            }
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
