#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the rounding modes to be used when the value of an animation variable is converted from a floating-point type to an integer type.
 * @see https://learn.microsoft.com/windows/win32/api/uianimation/ne-uianimation-ui_animation_rounding_mode
 * @namespace Windows.Win32.UI.Animation
 */
export default struct UI_ANIMATION_ROUNDING_MODE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
