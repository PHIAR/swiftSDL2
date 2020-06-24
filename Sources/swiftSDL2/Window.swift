import CSDL2
import Foundation

public final class Window {
    internal typealias SDL_Window = OpaquePointer

    public struct Flags: OptionSet {
        public static let borderless = Flags(rawValue: Int(sdl2_window_flags_borderless.rawValue))
        public static let foreign = Flags(rawValue: Int(sdl2_window_flags_foreign.rawValue))
        public static let fullscreen = Flags(rawValue: Int(sdl2_window_flags_fullscreen.rawValue))
        public static let fullscreen_desktop = Flags(rawValue: Int(sdl2_window_flags_fullscreen_desktop.rawValue))
        public static let hidden = Flags(rawValue: Int(sdl2_window_flags_hidden.rawValue))
        public static let highDPI = Flags(rawValue: Int(sdl2_window_flags_high_dpi.rawValue))
        public static let inputFocus = Flags(rawValue: Int(sdl2_window_flags_input_focus.rawValue))
        public static let inputGrabbed = Flags(rawValue: Int(sdl2_window_flags_input_grabbed.rawValue))
        public static let maximized = Flags(rawValue: Int(sdl2_window_flags_maximized.rawValue))

    #if os(iOS) || os(macOS) || os(tvOS)
        public static let metal = Flags(rawValue: Int(sdl2_window_flags_metal.rawValue))
    #endif

        public static let minimized = Flags(rawValue: Int(sdl2_window_flags_minimized.rawValue))
        public static let mouseCapture = Flags(rawValue: Int(sdl2_window_flags_mouse_capture.rawValue))
        public static let mouseFocus = Flags(rawValue: Int(sdl2_window_flags_mouse_focus.rawValue))
        public static let onTop = Flags(rawValue: Int(sdl2_window_flags_on_top.rawValue))
        public static let opengl = Flags(rawValue: Int(sdl2_window_flags_opengl.rawValue))
        public static let popupMenu = Flags(rawValue: Int(sdl2_window_flags_popup_menu.rawValue))
        public static let resizeable = Flags(rawValue: Int(sdl2_window_flags_resizeable.rawValue))
        public static let shown = Flags(rawValue: Int(sdl2_window_flags_shown.rawValue))
        public static let skipTaskbar = Flags(rawValue: Int(sdl2_window_flags_skip_taskbar.rawValue))
        public static let tooltip = Flags(rawValue: Int(sdl2_window_flags_tooltip.rawValue))
        public static let utility = Flags(rawValue: Int(sdl2_window_flags_utility.rawValue))
        public static let vulkan = Flags(rawValue: Int(sdl2_window_flags_vulkan.rawValue))

        public let rawValue: Int

        public init(rawValue: Int) {
            self.rawValue = rawValue
        }
    }

    private let window: SDL_Window

    public var surface: UnsafeMutablePointer <SDL_Surface>? {
        return SDL_GetWindowSurface(window)
    }

    public init(title: String,
                x: Int,
                y: Int,
                width: Int,
                height: Int,
                flags: Flags = Flags(rawValue: 0)) {
        self.window = title.withCString { _title in
            return SDL_CreateWindow(_title,
                                    Int32(x),
                                    Int32(y),
                                    Int32(width),
                                    Int32(height),
                                    UInt32(flags.rawValue))
        }
    }

    deinit {
        SDL_DestroyWindow(self.window)
    }

    public func createRenderer(index: Int,
                               flags: Renderer.Flags = Renderer.Flags(rawValue: 0)) -> Renderer {
        return Renderer(window: self.window,
                        index: index,
                        flags: flags)
    }

    public func updateWindowSurface() {
        SDL_UpdateWindowSurface(window)
    }
}
