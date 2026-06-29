#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines animation slope characteristics.
 * @see https://learn.microsoft.com/windows/win32/api/uianimation/ne-uianimation-ui_animation_slope
 * @namespace Windows.Win32.UI.Animation
 */
export default struct UI_ANIMATION_SLOPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * An increasing slope.
     * @type {Integer (Int32)}
     */
    static UI_ANIMATION_SLOPE_INCREASING => 0

    /**
     * A decreasing slope.
     * @type {Integer (Int32)}
     */
    static UI_ANIMATION_SLOPE_DECREASING => 1
}
