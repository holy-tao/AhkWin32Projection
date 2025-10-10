#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines results for animation updates.
 * @see https://docs.microsoft.com/windows/win32/api//uianimation/ne-uianimation-ui_animation_update_result
 * @namespace Windows.Win32.UI.Animation
 * @version v4.0.30319
 */
class UI_ANIMATION_UPDATE_RESULT{

    /**
     * No animation variables have changed.
     * @type {Integer (Int32)}
     */
    static UI_ANIMATION_UPDATE_NO_CHANGE => 0

    /**
     * One or more animation variables has changed.
     * @type {Integer (Int32)}
     */
    static UI_ANIMATION_UPDATE_VARIABLES_CHANGED => 1
}
