#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines results for animation updates.
 * @see https://learn.microsoft.com/windows/win32/api/uianimation/ne-uianimation-ui_animation_update_result
 * @namespace Windows.Win32.UI.Animation
 */
class UI_ANIMATION_UPDATE_RESULT extends Win32Enum {

    /**
     * No animation variables have changed.
     * Native name: UI_ANIMATION_UPDATE_NO_CHANGE
     * @type {Integer (Int32)}
     */
    static NO_CHANGE => 0

    /**
     * One or more animation variables has changed.
     * Native name: UI_ANIMATION_UPDATE_VARIABLES_CHANGED
     * @type {Integer (Int32)}
     */
    static VARIABLES_CHANGED => 1
}
