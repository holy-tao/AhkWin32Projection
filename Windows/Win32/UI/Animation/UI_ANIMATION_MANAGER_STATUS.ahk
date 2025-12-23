#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the activity status of an animation manager.
 * @see https://learn.microsoft.com/windows/win32/api/uianimation/ne-uianimation-ui_animation_manager_status
 * @namespace Windows.Win32.UI.Animation
 * @version v4.0.30319
 */
class UI_ANIMATION_MANAGER_STATUS extends Win32Enum{

    /**
     * The animation manager is idle; no animations are currently playing.
     * @type {Integer (Int32)}
     */
    static UI_ANIMATION_MANAGER_IDLE => 0

    /**
     * The animation manager is busy; at least one animation is currently playing or scheduled.
     * @type {Integer (Int32)}
     */
    static UI_ANIMATION_MANAGER_BUSY => 1
}
