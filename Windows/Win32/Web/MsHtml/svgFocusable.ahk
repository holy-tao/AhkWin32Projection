#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct svgFocusable {
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
    static svgFocusableNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static svgFocusableAuto => 1

    /**
     * @type {Integer (Int32)}
     */
    static svgFocusableTrue => 2

    /**
     * @type {Integer (Int32)}
     */
    static svgFocusableFalse => 3

    /**
     * @type {Integer (Int32)}
     */
    static svgFocusable_Max => 2147483647
}
