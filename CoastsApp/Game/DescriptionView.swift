import SwiftUI

struct DescriptionView: View {
    @Bindable var gameService: GameService

    @State var isPulsating: Bool = false

    var body: some View {
        ZStack {
            if gameService.isBad {
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
                
                Text("Собака, Заяц и Морковка")
                    .font(.largeTitle)
                
                Spacer().frame(height: 50)
                VStack(alignment: .leading) {
                    Text("Крестьянину нужно перевезти через реку собаку, зайца и морковь. У крестьянина есть лодка, в которой может поместиться, кроме самого крестьянина, только один объект — или собака, или заяц, или морковь.")
                    Spacer().frame(height: 50)
                    
                    HStack {
                        Image(systemName: "square.fill")
                        Text("Если крестьянин оставит без присмотра собаку с зайцем, то собака съест зайца")
                    }
                    HStack {
                        Image(systemName: "square.fill")
                        Text("Если крестьянин оставит без присмотра зайца с морковкой, заяй съест морковку")
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
            
            if gameService.isWin {
                RoundedRectangle(cornerRadius: 50)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(Color(.systemGreen.withAlphaComponent(0.4)))
                
                VStack {
                    Text("Вы справились!")
                        .font(.extraLargeTitle)
                        .bold()
                        .monospaced()
                    
                    Button("Начать заново") {
                        gameService.restart()
                    }
                    .foregroundStyle(.black)
                    .padding(50)
                    .font(.extraLargeTitle)
                    .bold()
                    .monospaced()
                }
                
            }
            
            if gameService.isGameOver {
                RoundedRectangle(cornerRadius: 50)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(Color(.systemRed.withAlphaComponent(0.4)))
                
                VStack {
                    Text("Вы проиграли!")
                        .font(.extraLargeTitle)
                        .bold()
                        .monospaced()
                    
                    Button("Начать заново") {
                        gameService.restart()
                    }
                    .foregroundStyle(.black)
                    .padding(50)
                    .font(.extraLargeTitle)
                    .bold()
                    .monospaced()
                }
                
            }
        }
            .onChange(of: gameService.isBad) { _, isBad in
                isPulsating = isBad
            }
    }
}
