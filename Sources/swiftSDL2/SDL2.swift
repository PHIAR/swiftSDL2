@_exported import CSDL2
import Foundation

public final class SDL2 {
    public typealias Event = SDL_Event

    public struct Flags: OptionSet {
        public static let audio = Flags(rawValue: 0x01)
        public static let everything = Flags(rawValue: 0x02)
        public static let gameController = Flags(rawValue: 0x04)
        public static let haptic = Flags(rawValue: 0x08)
        public static let joystick = Flags(rawValue: 0x10)
        public static let noParachute = Flags(rawValue: 0x20)
        public static let timer = Flags(rawValue: 0x40)
        public static let video = Flags(rawValue: 0x80)

        public let rawValue: Int

        public init(rawValue: Int) {
            self.rawValue = rawValue
        }
    }

    private static var instance: SDL2!

    public static func initialize(flags: Flags) {
        var _flags = UInt32(0)

        if flags.contains(.audio) {
            _flags = sdl2_flags_audio.rawValue
        }

        if flags.contains(.everything) {
            _flags = sdl2_flags_everything.rawValue
        }

        if flags.contains(.gameController) {
            _flags = sdl2_flags_game_controller.rawValue
        }

        if flags.contains(.haptic) {
            _flags = sdl2_flags_haptic.rawValue
        }

        if flags.contains(.joystick) {
            _flags = sdl2_flags_joystick.rawValue
        }

        if flags.contains(.noParachute) {
            _flags = sdl2_flags_no_parachute.rawValue
        }

        if flags.contains(.timer) {
            _flags = sdl2_flags_timer.rawValue
        }

        if flags.contains(.video) {
            _flags = sdl2_flags_video.rawValue
        }

        SDL2.instance = SDL2(flags: _flags)
    }

    public static func eventLoop(callback: @escaping (Event) -> Bool) {
        var quit = false

        while !quit {
            var event = SDL_Event()

            while SDL_PollEvent(&event) != 0 {
                if !callback(event) {
                    quit = true
                    break
                }
            }
        }
    }

    private init(flags: UInt32) {
        SDL_Init(flags)
    }

    deinit {
        SDL_Quit()
    }
}