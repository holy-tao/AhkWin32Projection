#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the manipulations that can be mapped to mouse wheel rotation.
 * @see https://learn.microsoft.com/windows/win32/api/interactioncontext/ne-interactioncontext-mouse_wheel_parameter
 * @namespace Windows.Win32.UI.InteractionContext
 */
export default struct MOUSE_WHEEL_PARAMETER {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Scrolling/panning distance along the x-axis.
     * @type {Integer (Int32)}
     */
    static MOUSE_WHEEL_PARAMETER_CHAR_TRANSLATION_X => 1

    /**
     * Scrolling/panning distance along the y-axis.
     * @type {Integer (Int32)}
     */
    static MOUSE_WHEEL_PARAMETER_CHAR_TRANSLATION_Y => 2

    /**
     * The relative change in scale, as a multiplier, since the last input message.
     * @type {Integer (Int32)}
     */
    static MOUSE_WHEEL_PARAMETER_DELTA_SCALE => 3

    /**
     * The relative change in rotation, in radians, since the last input message.
     * @type {Integer (Int32)}
     */
    static MOUSE_WHEEL_PARAMETER_DELTA_ROTATION => 4

    /**
     * Paging distance along the x-axis.
     * @type {Integer (Int32)}
     */
    static MOUSE_WHEEL_PARAMETER_PAGE_TRANSLATION_X => 5

    /**
     * Paging distance along the y-axis.
     * @type {Integer (Int32)}
     */
    static MOUSE_WHEEL_PARAMETER_PAGE_TRANSLATION_Y => 6

    /**
     * Maximum number of interactions exceeded.
     * @type {Integer (Int32)}
     */
    static MOUSE_WHEEL_PARAMETER_MAX => -1
}
