import CSDL2
import Foundation

public final class Renderer {
    internal typealias SDL_Renderer = OpaquePointer

    public struct Flags: OptionSet {
        public static let accelerated = Flags(rawValue: 0x00001)
        public static let presentVSync = Flags(rawValue: 0x00002)
        public static let software = Flags(rawValue: 0x00004)
        public static let targetTexture = Flags(rawValue: 0x00008)

        public let rawValue: Int

        public init(rawValue: Int) {
            self.rawValue = rawValue
        }
    }

    private let renderer: SDL_Renderer

    internal init(window: Window.SDL_Window,
                  index: Int,
                  flags: Flags) {
        var _flags = UInt32(0)

        if flags.contains(.accelerated) {
            _flags |= sdl2_renderer_flags_accelerated.rawValue
        }

        if flags.contains(.presentVSync) {
            _flags |= sdl2_renderer_flags_present_vsync.rawValue
        }

        if flags.contains(.software) {
            _flags |= sdl2_renderer_flags_software.rawValue
        }

        if flags.contains(.targetTexture) {
            _flags |= sdl2_renderer_flags_target_texture.rawValue
        }

        self.renderer = SDL_CreateRenderer(window, Int32(index), _flags)
    }

    deinit {
        SDL_DestroyRenderer(self.renderer)
    }

    public func createTexture(pixelformat: sdl2_pixelformat_e,
                              textureAccess: sdl2_texture_access_e,
                              width: Int,
                              height: Int) -> Texture {
        return Texture(renderer: self.renderer,
                       pixelformat: pixelformat,
                       textureAccess: textureAccess,
                       width: width,
                       height: height)
    }
}
