#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct styleMsAnimationFillMode {
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
    static styleMsAnimationFillModeNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleMsAnimationFillModeForwards => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleMsAnimationFillModeBackwards => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleMsAnimationFillModeBoth => 3

    /**
     * @type {Integer (Int32)}
     */
    static styleMsAnimationFillModeNotSet => 4

    /**
     * @type {Integer (Int32)}
     */
    static styleMsAnimationFillMode_Max => 2147483647
}
