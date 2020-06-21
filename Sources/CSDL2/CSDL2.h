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