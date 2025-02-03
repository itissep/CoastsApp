import SwiftUI
import RealityKit
import UniformTypeIdentifiers
import Observation

@Observable
class ViewModel {

    private var contentEntity = Entity()

    var leftListItems = ["dog.fill",
                         "hare.fill",
                         "carrot.fill"] {
        didSet {
            check()
        }
    }


    var rightListItems = [String]() {
        didSet {
            check()
        }
    }

    var isHomeTargeted = false
    var isOtherTargeted = false

    var isBad: Bool = false {
        didSet {
            if !isBad {
                setTimer()
            }
        }
    }

    var isGameOver: Bool = false
    var isWin: Bool = false

    func setTimer() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) { [weak self] in
            guard let self else {
                 return
            }
            if self.isBad {
                self.isGameOver = true
            }
        }
    }

    func check() {
        if
            leftListItems.contains("dog.fill") && leftListItems.contains("hare.fill") && leftListItems.count == 2
                ||
            rightListItems.contains("dog.fill") && rightListItems.contains("hare.fill") && rightListItems.count == 2
                ||
            leftListItems.contains("hare.fill") && leftListItems.contains("carrot.fill") && leftListItems.count == 2
                ||
            rightListItems.contains("hare.fill") && rightListItems.contains("carrot.fill") && rightListItems.count == 2

        {
            isBad = true
        } else {
            isBad = false
        }

        if rightListItems.count == 3 {
            isWin = true
        }

    }

    func restart() {
        leftListItems = ["dog.fill", "hare.fill", "carrot.fill"]
        rightListItems = []
        isBad = false
        isWin = false
        isGameOver = false
    }

    func setupContentEntity() -> Entity {
        contentEntity
    }
}
