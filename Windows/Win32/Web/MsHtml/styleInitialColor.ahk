#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct styleInitialColor {
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
    static styleInitialColorNoInitial => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleInitialColorColorProperty => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleInitialColorTransparent => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleInitialColorInvert => 3

    /**
     * @type {Integer (Int32)}
     */
    static styleInitialColor_Max => 2147483647
}
