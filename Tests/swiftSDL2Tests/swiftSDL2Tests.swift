@testable import swiftSDL2
import XCTest

internal final class swiftSDL2Tests: XCTestCase {
    func testWindow() {
        SDL2.initialize(flags: .everything)

        let window = Window(title: "Hello World!",
                            x: 0,
                            y: 0,
                            width: 640,
                            height: 480,
                            flags: .shown)

        SDL2.eventLoop { event in
            switch event.type {
            case SDL_KEYDOWN.rawValue:
                return false

            default:
                break
            }

            return true
        }
    }

    static var allTests = [
        ("testWindow", testWindow),
    ]
}
