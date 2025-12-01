#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines animation modes.
 * @see https://learn.microsoft.com/windows/win32/api/uianimation/ne-uianimation-ui_animation_mode
 * @namespace Windows.Win32.UI.Animation
 * @version v4.0.30319
 */
class UI_ANIMATION_MODE extends Win32Enum{

    /**
     * Animation is disabled.
     * @type {Integer (Int32)}
     */
    static UI_ANIMATION_MODE_DISABLED => 0

    /**
     * The animation mode is managed by the system.
     * @type {Integer (Int32)}
     */
    static UI_ANIMATION_MODE_SYSTEM_DEFAULT => 1

    /**
     * Animation is enabled.
     * @type {Integer (Int32)}
     */
    static UI_ANIMATION_MODE_ENABLED => 2
}
