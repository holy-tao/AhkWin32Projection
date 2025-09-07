#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the rounding modes to be used when the value of an animation variable is converted from a floating-point type to an integer type.
 * @see https://learn.microsoft.com/windows/win32/api/uianimation/ne-uianimation-ui_animation_rounding_mode
 * @namespace Windows.Win32.UI.Animation
 * @version v4.0.30319
 */
class UI_ANIMATION_ROUNDING_MODE{

    /**
     * Round to the nearest integer.
     * @type {Integer (Int32)}
     */
    static UI_ANIMATION_ROUNDING_NEAREST => 0

    /**
     * Round down.
     * @type {Integer (Int32)}
     */
    static UI_ANIMATION_ROUNDING_FLOOR => 1

    /**
     * Round up.
     * @type {Integer (Int32)}
     */
    static UI_ANIMATION_ROUNDING_CEILING => 2
}
