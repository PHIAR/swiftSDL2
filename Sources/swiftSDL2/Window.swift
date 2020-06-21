import CSDL2
import Foundation

public final class Window {
    private typealias SDL_Window = OpaquePointer

    public struct Flags: OptionSet {
        public static let highDPI = Flags(rawValue: 0x00001)
        public static let onTop = Flags(rawValue: 0x00002)
        public static let borderless = Flags(rawValue: 0x00004)
        public static let foreign = Flags(rawValue: 0x00008)
        public static let fullscreen = Flags(rawValue: 0x00010)
        public static let fullscreen_desktop = Flags(rawValue: 0x00020)
        public static let hidden = Flags(rawValue: 0x00040)
        public static let inputFocus = Flags(rawValue: 0x00080)
        public static let inputGrabbed = Flags(rawValue: 0x00100)
        public static let maximized = Flags(rawValue: 0x00200)
        public static let minimized = Flags(rawValue: 0x00400)
        public static let mouseCapture = Flags(rawValue: 0x00800)
        public static let mouseFocus = Flags(rawValue: 0x01000)
        public static let opengl = Flags(rawValue: 0x02000)
        public static let popupMenu = Flags(rawValue: 0x04000)
        public static let resizeable = Flags(rawValue: 0x08000)
        public static let shown = Flags(rawValue: 0x010000)
        public static let skipTaskbar = Flags(rawValue: 0x020000)
        public static let tooltip = Flags(rawValue: 0x040000)
        public static let utility = Flags(rawValue: 0x080000)
        public static let vulkan = Flags(rawValue: 0x100000)

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
        var _flags = UInt32(0)

        if flags.contains(.borderless) {
            _flags |= sdl2_window_flags_borderless.rawValue
        }

        if flags.contains(.foreign) {
            _flags |= sdl2_window_flags_foreign.rawValue
        }

        if flags.contains(.fullscreen) {
            _flags |= sdl2_window_flags_fullscreen.rawValue
        }

        if flags.contains(.fullscreen_desktop) {
            _flags |= sdl2_window_flags_fullscreen_desktop.rawValue
        }

        if flags.contains(.hidden) {
            _flags |= sdl2_window_flags_hidden.rawValue
        }

        if flags.contains(.highDPI) {
            _flags |= sdl2_window_flags_high_dpi.rawValue
        }

        if flags.contains(.inputFocus) {
            _flags |= sdl2_window_flags_input_focus.rawValue
        }

        if flags.contains(.inputGrabbed) {
            _flags |= sdl2_window_flags_input_grabbed.rawValue
        }

        if flags.contains(.maximized) {
            _flags |= sdl2_window_flags_maximized.rawValue
        }

        if flags.contains(.minimized) {
            _flags |= sdl2_window_flags_minimized.rawValue
        }

        if flags.contains(.mouseCapture) {
            _flags |= sdl2_window_flags_mouse_capture.rawValue
        }

        if flags.contains(.mouseFocus) {
            _flags |= sdl2_window_flags_mouse_focus.rawValue
        }

        if flags.contains(.onTop) {
            _flags |= sdl2_window_flags_on_top.rawValue
        }

        if flags.contains(.opengl) {
            _flags |= sdl2_window_flags_opengl.rawValue
        }

        if flags.contains(.popupMenu) {
            _flags |= sdl2_window_flags_popup_menu.rawValue
        }

        if flags.contains(.resizeable) {
            _flags |= sdl2_window_flags_resizeable.rawValue
        }
        
        if flags.contains(.shown) {
            _flags |= sdl2_window_flags_shown.rawValue
        }
        
        if flags.contains(.skipTaskbar) {
            _flags |= sdl2_window_flags_skip_taskbar.rawValue
        }
        
        if flags.contains(.tooltip) {
            _flags |= sdl2_window_flags_tooltip.rawValue
        }
        
        if flags.contains(.utility) {
            _flags |= sdl2_window_flags_utility.rawValue
        }
        
        if flags.contains(.vulkan) {
            _flags |= sdl2_window_flags_vulkan.rawValue
        }

        self.window = title.withCString { _title in
            return SDL_CreateWindow(_title,
                                    Int32(x),
                                    Int32(y),
                                    Int32(width),
                                    Int32(height),
                                    _flags)
        }
    }

    deinit {
        SDL_DestroyWindow(self.window)
    }

    public func updateWindowSurface() {
        SDL_UpdateWindowSurface(window)
    }
}