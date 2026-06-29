#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct styleLayoutGridLine {
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
    static styleLayoutGridLineNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleLayoutGridLineAuto => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleLayoutGridLineNone => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleLayoutGridLine_Max => 2147483647
}
