import CSDL2
import Foundation

public final class Texture {
    internal typealias SDL_Texture = OpaquePointer

    private let texture: SDL_Texture

    internal init(renderer: Renderer.SDL_Renderer,
                  pixelformat: sdl2_pixelformat_e,
                  textureAccess: sdl2_texture_access_e,
                  width: Int,
                  height: Int) {
        self.texture = SDL_CreateTexture(renderer,
                                         UInt32(pixelformat.rawValue),
                                         Int32(textureAccess.rawValue),
                                         Int32(width),
                                         Int32(height))
    }

    deinit {
        SDL_DestroyTexture(self.texture)
    }
}
