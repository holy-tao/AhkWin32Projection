#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct MXDC_LANDSCAPE_ROTATION_ENUMS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static MXDC_LANDSCAPE_ROTATE_COUNTERCLOCKWISE_90_DEGREES => 90

    /**
     * @type {Integer (Int32)}
     */
    static MXDC_LANDSCAPE_ROTATE_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static MXDC_LANDSCAPE_ROTATE_COUNTERCLOCKWISE_270_DEGREES => -90
}
