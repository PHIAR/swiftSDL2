import CSDL2
import Foundation

public final class Texture {
    internal typealias SDL_Texture = OpaquePointer

    public struct Access: OptionSet {
        public static let `static` = Access(rawValue: Int(sdl2_texture_access_static.rawValue))
        public static let streaming = Access(rawValue: Int(sdl2_texture_access_streaming.rawValue))
        public static let target = Access(rawValue: Int(sdl2_texture_access_target.rawValue))

        public let rawValue: Int

        public init(rawValue: Int) {
            self.rawValue = rawValue
        }
    }

    public struct Pixelformat {
        public static let unknown = Pixelformat(rawValue: Int(sdl2_pixelformat_unknown.rawValue))
        public static let index1_lsb = Pixelformat(rawValue: Int(sdl2_pixelformat_index1_lsb.rawValue))
        public static let index1_msb = Pixelformat(rawValue: Int(sdl2_pixelformat_index1_msb.rawValue))
        public static let index4_lsb = Pixelformat(rawValue: Int(sdl2_pixelformat_index4_lsb.rawValue))
        public static let index4_msb = Pixelformat(rawValue: Int(sdl2_pixelformat_index4_msb.rawValue))
        public static let index8 = Pixelformat(rawValue: Int(sdl2_pixelformat_index8.rawValue))
        public static let rgb332 = Pixelformat(rawValue: Int(sdl2_pixelformat_rgb332.rawValue))
        public static let rgb444 = Pixelformat(rawValue: Int(sdl2_pixelformat_rgb444.rawValue))
        public static let rgb555 = Pixelformat(rawValue: Int(sdl2_pixelformat_rgb555.rawValue))
        public static let bgr555 = Pixelformat(rawValue: Int(sdl2_pixelformat_bgr555.rawValue))
        public static let argb4444 = Pixelformat(rawValue: Int(sdl2_pixelformat_argb4444.rawValue))
        public static let rgba4444 = Pixelformat(rawValue: Int(sdl2_pixelformat_rgba4444.rawValue))
        public static let abgr4444 = Pixelformat(rawValue: Int(sdl2_pixelformat_abgr4444.rawValue))
        public static let bgra4444 = Pixelformat(rawValue: Int(sdl2_pixelformat_bgra4444.rawValue))
        public static let argb1555 = Pixelformat(rawValue: Int(sdl2_pixelformat_argb1555.rawValue))
        public static let rgba5551 = Pixelformat(rawValue: Int(sdl2_pixelformat_rgba5551.rawValue))
        public static let abgr1555 = Pixelformat(rawValue: Int(sdl2_pixelformat_abgr1555.rawValue))
        public static let bgra5551 = Pixelformat(rawValue: Int(sdl2_pixelformat_bgra5551.rawValue))
        public static let rgb565 = Pixelformat(rawValue: Int(sdl2_pixelformat_rgb565.rawValue))
        public static let bgr565 = Pixelformat(rawValue: Int(sdl2_pixelformat_bgr565.rawValue))
        public static let rgb24 = Pixelformat(rawValue: Int(sdl2_pixelformat_rgb24.rawValue))
        public static let bgr24 = Pixelformat(rawValue: Int(sdl2_pixelformat_bgr24.rawValue))
        public static let rgb888 = Pixelformat(rawValue: Int(sdl2_pixelformat_rgb888.rawValue))
        public static let rgbx888 = Pixelformat(rawValue: Int(sdl2_pixelformat_rgbx888.rawValue))
        public static let bgr888 = Pixelformat(rawValue: Int(sdl2_pixelformat_bgr888.rawValue))
        public static let bgrx8888 = Pixelformat(rawValue: Int(sdl2_pixelformat_bgrx8888.rawValue))
        public static let argb8888 = Pixelformat(rawValue: Int(sdl2_pixelformat_argb8888.rawValue))
        public static let rgba8888 = Pixelformat(rawValue: Int(sdl2_pixelformat_rgba8888.rawValue))
        public static let abgr8888 = Pixelformat(rawValue: Int(sdl2_pixelformat_abgr8888.rawValue))
        public static let bgra8888 = Pixelformat(rawValue: Int(sdl2_pixelformat_bgra8888.rawValue))
        public static let argb2101010 = Pixelformat(rawValue: Int(sdl2_pixelformat_argb2101010.rawValue))
        public static let rgba32 = Pixelformat(rawValue: Int(sdl2_pixelformat_rgba32.rawValue))
        public static let argb32 = Pixelformat(rawValue: Int(sdl2_pixelformat_argb32.rawValue))
        public static let bgra32 = Pixelformat(rawValue: Int(sdl2_pixelformat_bgra32.rawValue))
        public static let abgr32 = Pixelformat(rawValue: Int(sdl2_pixelformat_abgr32.rawValue))
        public static let yv12 = Pixelformat(rawValue: Int(sdl2_pixelformat_yv12.rawValue))
        public static let iyuv = Pixelformat(rawValue: Int(sdl2_pixelformat_iyuv.rawValue))
        public static let yuv2 = Pixelformat(rawValue: Int(sdl2_pixelformat_yuv2.rawValue))
        public static let uyvy = Pixelformat(rawValue: Int(sdl2_pixelformat_uyvy.rawValue))
        public static let yvyu = Pixelformat(rawValue: Int(sdl2_pixelformat_yvyu.rawValue))
        public static let nv12 = Pixelformat(rawValue: Int(sdl2_pixelformat_nv12.rawValue))
        public static let nv21 = Pixelformat(rawValue: Int(sdl2_pixelformat_nv21.rawValue))

        public let rawValue: Int

        public init(rawValue: Int) {
            self.rawValue = rawValue
        }
    }

    private let texture: SDL_Texture

    internal init(renderer: Renderer.SDL_Renderer,
                  pixelformat: Pixelformat,
                  textureAccess: Access,
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

    internal func copy(renderer: Renderer.SDL_Renderer) {
        let flip = Renderer.Flip.horizontal

        SDL_RenderCopyEx(renderer,
                         self.texture,
                         nil,
                         nil,
                         0.0,
                         nil,
                         SDL_RendererFlip(UInt32(flip.rawValue)));
    }

    public func update(pixels: UnsafeRawPointer,
                       pitch: Int) {
        SDL_UpdateTexture(self.texture, nil, pixels, Int32(pitch))
    }

    public func update(rect: CGRect,
                       pixels: UnsafeRawPointer,
                       pitch: Int) {
        var _rect = SDL_Rect()

        _rect.x = Int32(rect.minX)
        _rect.y = Int32(rect.minY)
        _rect.w = Int32(rect.width)
        _rect.h = Int32(rect.height)

        SDL_UpdateTexture(self.texture, &_rect, pixels, Int32(pitch))
    }
}
