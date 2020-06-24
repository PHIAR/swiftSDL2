import CSDL2
import Foundation

public final class Renderer {
    internal typealias SDL_Renderer = OpaquePointer

    public struct Flags: OptionSet {
        public static let accelerated = Flags(rawValue: Int(sdl2_renderer_flags_accelerated.rawValue))
        public static let presentVSync = Flags(rawValue: Int(sdl2_renderer_flags_present_vsync.rawValue))
        public static let software = Flags(rawValue: Int(sdl2_renderer_flags_software.rawValue))
        public static let targetTexture = Flags(rawValue: Int(sdl2_renderer_flags_target_texture.rawValue))

        public let rawValue: Int

        public init(rawValue: Int) {
            self.rawValue = rawValue
        }
    }

    public struct Flip: OptionSet {
        public static let none = Flip(rawValue: Int(sdl2_flip_none.rawValue))
        public static let horizontal = Flip(rawValue: Int(sdl2_flip_horizontal.rawValue))
        public static let vertical = Flip(rawValue: Int(sdl2_flip_vertical.rawValue))

        public let rawValue: Int

        public init(rawValue: Int) {
            self.rawValue = rawValue
        }
    }

    private let renderer: SDL_Renderer

    internal init(window: Window.SDL_Window,
                  index: Int,
                  flags: Flags) {
        self.renderer = SDL_CreateRenderer(window, Int32(index), UInt32(flags.rawValue))
    }

    deinit {
        SDL_DestroyRenderer(self.renderer)
    }

    public func clear() {
        SDL_RenderClear(renderer)
    }

    public func copy(texture: Texture) {
        texture.copy(renderer: self.renderer)
    }

    public func createTexture(pixelformat: Texture.Pixelformat,
                              textureAccess: Texture.Access,
                              width: Int,
                              height: Int) -> Texture {
        return Texture(renderer: self.renderer,
                       pixelformat: pixelformat,
                       textureAccess: textureAccess,
                       width: width,
                       height: height)
    }

    public func present() {
        SDL_RenderPresent(self.renderer)
    }
}
