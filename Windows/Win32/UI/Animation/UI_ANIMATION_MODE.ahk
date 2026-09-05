#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines animation modes.
 * @see https://learn.microsoft.com/windows/win32/api/uianimation/ne-uianimation-ui_animation_mode
 * @namespace Windows.Win32.UI.Animation
 */
class UI_ANIMATION_MODE extends Win32Enum {

    /**
     * Animation is disabled.
     * Native name: UI_ANIMATION_MODE_DISABLED
     * @type {Integer (Int32)}
     */
    static DISABLED => 0

    /**
     * The animation mode is managed by the system.
     * Native name: UI_ANIMATION_MODE_SYSTEM_DEFAULT
     * @type {Integer (Int32)}
     */
    static SYSTEM_DEFAULT => 1

    /**
     * Animation is enabled.
     * Native name: UI_ANIMATION_MODE_ENABLED
     * @type {Integer (Int32)}
     */
    static ENABLED => 2
}
