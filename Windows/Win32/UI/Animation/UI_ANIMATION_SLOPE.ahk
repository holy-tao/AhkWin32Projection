#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines animation slope characteristics.
 * @see https://learn.microsoft.com/windows/win32/api/uianimation/ne-uianimation-ui_animation_slope
 * @namespace Windows.Win32.UI.Animation
 */
class UI_ANIMATION_SLOPE extends Win32Enum {

    /**
     * An increasing slope.
     * Native name: UI_ANIMATION_SLOPE_INCREASING
     * @type {Integer (Int32)}
     */
    static INCREASING => 0

    /**
     * A decreasing slope.
     * Native name: UI_ANIMATION_SLOPE_DECREASING
     * @type {Integer (Int32)}
     */
    static DECREASING => 1
}
