import SwiftUI

struct DescriptionView: View {
    @Bindable var viewModel: ViewModel
    @Environment(\.openWindow) private var openWindow

    @State var isPulsating: Bool = false

    var body: some View {
            ZStack {
                if viewModel.isBad {
                    RoundedRectangle(cornerRadius: 50)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(isPulsating ? .red : Color(.secondarySystemFill))
                        .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true), value: isPulsating) // Анимация

                } else {
                    RoundedRectangle(cornerRadius: 50)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(Color(.secondarySystemFill))
                }

                VStack {
                    Text("Игра")
                        .font(.title)

                    Text("Волк, Овца и Капуста")
                        .font(.largeTitle)

                    Spacer().frame(height: 50)
                    VStack(alignment: .leading) {
                        Text("Крестьянину нужно перевезти через реку волка, козу и капусту. У крестьянина есть лодка, в которой может поместиться, кроме самого крестьянина, только один объект — или волк, или коза, или капуста.")
                        Spacer().frame(height: 50)

                        HStack {
                            Image(systemName: "square.fill")
                            Text("Если крестьянин оставит без присмотра волка с козой, то волк съест козу")
                        }
                        HStack {
                            Image(systemName: "square.fill")
                            Text("Если крестьянин оставит без присмотра козу с капустой, коза съест капусту")
                        }
                        HStack {
                            Image(systemName: "square.fill")
                            Text("В присутствии же крестьянина никто никого не ест")
                        }
                        Spacer().frame(height: 50)
                    }
                    .font(.title3)

                    Text("Как крестьянину перевезти на другой берег всё своё имущество в целости и сохранности?")
                        .multilineTextAlignment(.center)
                        .font(.title)
                }
                .monospaced()
                .padding(50)

                if viewModel.isWin {
                    RoundedRectangle(cornerRadius: 50)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(Color(.systemGreen.withAlphaComponent(0.4)))

                    VStack {
                        Text("Вы справились!")
                            .font(.extraLargeTitle)
                            .bold()
                            .monospaced()

                        Button("Начать заново") {
                            viewModel.restart()
                        }
                        .foregroundStyle(.black)
                        .padding(50)
                        .font(.extraLargeTitle)
                        .bold()
                        .monospaced()
                    }

                }

                if viewModel.isGameOver {
                    RoundedRectangle(cornerRadius: 50)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(Color(.systemRed.withAlphaComponent(0.4)))

                    VStack {
                        Text("Вы проиграли!")
                            .font(.extraLargeTitle)
                            .bold()
                            .monospaced()

                        Button("Начать заново") {
                            viewModel.restart()
                        }
                        .foregroundStyle(.black)
                        .padding(50)
                        .font(.extraLargeTitle)
                        .bold()
                        .monospaced()
                    }

                }
            }.onAppear() {
                openWindow(id: "second")
                openWindow(id: "first")
            }
            .onChange(of: viewModel.isBad) { _, isBad in
                isPulsating = isBad
            }
    }
}
