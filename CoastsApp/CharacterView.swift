import SwiftUI
import RealityKit
import UniformTypeIdentifiers
import Observation

struct CharacterView: View {
    let items: [String]

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 50)
                .frame(maxWidth: .infinity)
                .foregroundColor(.land)

            HStack(spacing: 12) {
                ForEach(items, id: \.self) { item in
                    Image(systemName: item)
                        .font(.system(size: 100))
                        .foregroundColor(.black)
                        .draggable(item)
                }
            }
            .padding(.vertical)
        }
    }
}
