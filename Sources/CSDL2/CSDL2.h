#pragma once

#define _REENTRANT

#include <SDL2/SDL.h>

typedef enum sdl2_flags_e {
    sdl2_flags_audio = SDL_INIT_AUDIO,
    sdl2_flags_everything = SDL_INIT_EVERYTHING,
    sdl2_flags_game_controller = SDL_INIT_GAMECONTROLLER,
    sdl2_flags_haptic = SDL_INIT_HAPTIC,
    sdl2_flags_joystick = SDL_INIT_JOYSTICK,
    sdl2_flags_no_parachute = SDL_INIT_NOPARACHUTE,
    sdl2_flags_timer = SDL_INIT_TIMER,
    sdl2_flags_video = SDL_INIT_VIDEO,
} sdl2_flags_e;

typedef enum sdl2_flip_e {
    sdl2_flip_none = SDL_FLIP_NONE,
    sdl2_flip_horizontal = SDL_FLIP_HORIZONTAL,
    sdl2_flip_vertical = SDL_FLIP_VERTICAL,
} sdl2_flip_e;

typedef enum sdl2_pixelformat_e {
    sdl2_pixelformat_unknown = SDL_PIXELFORMAT_UNKNOWN,
    sdl2_pixelformat_index1_lsb = SDL_PIXELFORMAT_INDEX1LSB,
    sdl2_pixelformat_index1_msb = SDL_PIXELFORMAT_INDEX1MSB,
    sdl2_pixelformat_index4_lsb = SDL_PIXELFORMAT_INDEX4LSB,
    sdl2_pixelformat_index4_msb = SDL_PIXELFORMAT_INDEX4MSB,
    sdl2_pixelformat_index8 = SDL_PIXELFORMAT_INDEX8,
    sdl2_pixelformat_rgb332 = SDL_PIXELFORMAT_RGB332,
    sdl2_pixelformat_rgb444 = SDL_PIXELFORMAT_RGB444,
    sdl2_pixelformat_rgb555 = SDL_PIXELFORMAT_RGB555,
    sdl2_pixelformat_bgr555 = SDL_PIXELFORMAT_BGR555,
    sdl2_pixelformat_argb4444 = SDL_PIXELFORMAT_ARGB4444,
    sdl2_pixelformat_rgba4444 = SDL_PIXELFORMAT_RGBA4444,
    sdl2_pixelformat_abgr4444 = SDL_PIXELFORMAT_ABGR4444,
    sdl2_pixelformat_bgra4444 = SDL_PIXELFORMAT_BGRA4444,
    sdl2_pixelformat_argb1555 = SDL_PIXELFORMAT_ARGB1555,
    sdl2_pixelformat_rgba5551 = SDL_PIXELFORMAT_RGBA5551,
    sdl2_pixelformat_abgr1555 = SDL_PIXELFORMAT_ABGR1555,
    sdl2_pixelformat_bgra5551 = SDL_PIXELFORMAT_BGRA5551,
    sdl2_pixelformat_rgb565 = SDL_PIXELFORMAT_RGB565,
    sdl2_pixelformat_bgr565 = SDL_PIXELFORMAT_BGR565,
    sdl2_pixelformat_rgb24 = SDL_PIXELFORMAT_RGB24,
    sdl2_pixelformat_bgr24 = SDL_PIXELFORMAT_BGR24,
    sdl2_pixelformat_rgb888 = SDL_PIXELFORMAT_RGB888,
    sdl2_pixelformat_rgbx888 = SDL_PIXELFORMAT_RGBX8888,
    sdl2_pixelformat_bgr888 = SDL_PIXELFORMAT_BGR888,
    sdl2_pixelformat_bgrx8888 = SDL_PIXELFORMAT_BGRX8888,
    sdl2_pixelformat_argb8888 = SDL_PIXELFORMAT_ARGB8888,
    sdl2_pixelformat_rgba8888 = SDL_PIXELFORMAT_RGBA8888,
    sdl2_pixelformat_abgr8888 = SDL_PIXELFORMAT_ABGR8888,
    sdl2_pixelformat_bgra8888 = SDL_PIXELFORMAT_BGRA8888,
    sdl2_pixelformat_argb2101010 = SDL_PIXELFORMAT_ARGB2101010,
    sdl2_pixelformat_rgba32 = SDL_PIXELFORMAT_RGBA32,
    sdl2_pixelformat_argb32 = SDL_PIXELFORMAT_ARGB32,
    sdl2_pixelformat_bgra32 = SDL_PIXELFORMAT_BGRA32,
    sdl2_pixelformat_abgr32 = SDL_PIXELFORMAT_ABGR32,
    sdl2_pixelformat_yv12 = SDL_PIXELFORMAT_YV12,
    sdl2_pixelformat_iyuv = SDL_PIXELFORMAT_IYUV,
    sdl2_pixelformat_yuy2 = SDL_PIXELFORMAT_YUY2,
    sdl2_pixelformat_uyvy = SDL_PIXELFORMAT_UYVY,
    sdl2_pixelformat_yvyu = SDL_PIXELFORMAT_YVYU,
    sdl2_pixelformat_nv12 = SDL_PIXELFORMAT_NV12,
    sdl2_pixelformat_nv21 = SDL_PIXELFORMAT_NV21
} sdl2_pixelformat_e;

typedef enum sdl2_renderer_flags_e {
    sdl2_renderer_flags_accelerated = SDL_RENDERER_ACCELERATED,
    sdl2_renderer_flags_present_vsync = SDL_RENDERER_PRESENTVSYNC,
    sdl2_renderer_flags_software = SDL_RENDERER_SOFTWARE,
    sdl2_renderer_flags_target_texture = SDL_RENDERER_TARGETTEXTURE,
} sdl2_renderer_flags_e;

typedef enum sdl2_texture_access_e {
    sdl2_texture_access_static = SDL_TEXTUREACCESS_STATIC,
    sdl2_texture_access_streaming = SDL_TEXTUREACCESS_STREAMING,
    sdl2_texture_access_target = SDL_TEXTUREACCESS_TARGET,
} sdl2_texture_access_e;

typedef enum sdl2_window_flags_e {
    sdl2_window_flags_borderless = SDL_WINDOW_BORDERLESS,
    sdl2_window_flags_foreign = SDL_WINDOW_FOREIGN,
    sdl2_window_flags_fullscreen = SDL_WINDOW_FULLSCREEN,
    sdl2_window_flags_fullscreen_desktop = SDL_WINDOW_FULLSCREEN_DESKTOP,
    sdl2_window_flags_hidden = SDL_WINDOW_HIDDEN,
    sdl2_window_flags_high_dpi = SDL_WINDOW_ALLOW_HIGHDPI,
    sdl2_window_flags_input_focus = SDL_WINDOW_INPUT_FOCUS,
    sdl2_window_flags_input_grabbed = SDL_WINDOW_INPUT_GRABBED,
    sdl2_window_flags_maximized = SDL_WINDOW_MAXIMIZED,

#ifdef __APPLE__
    sdl2_window_flags_metal = SDL_WINDOW_METAL,
#endif

    sdl2_window_flags_minimized = SDL_WINDOW_MINIMIZED,
    sdl2_window_flags_mouse_capture = SDL_WINDOW_MOUSE_CAPTURE,
    sdl2_window_flags_mouse_focus = SDL_WINDOW_MOUSE_FOCUS,
    sdl2_window_flags_opengl = SDL_WINDOW_OPENGL,
    sdl2_window_flags_on_top = SDL_WINDOW_ALWAYS_ON_TOP,
    sdl2_window_flags_popup_menu = SDL_WINDOW_POPUP_MENU,
    sdl2_window_flags_resizeable = SDL_WINDOW_RESIZABLE,
    sdl2_window_flags_shown = SDL_WINDOW_SHOWN,
    sdl2_window_flags_skip_taskbar = SDL_WINDOW_SKIP_TASKBAR,
    sdl2_window_flags_tooltip = SDL_WINDOW_TOOLTIP,
    sdl2_window_flags_utility = SDL_WINDOW_UTILITY,
    sdl2_window_flags_vulkan = SDL_WINDOW_VULKAN,
} sdl_window_flags_e;
