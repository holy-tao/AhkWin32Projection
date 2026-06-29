#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct styleLayoutGridMode {
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
    static styleLayoutGridModeNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleLayoutGridModeChar => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleLayoutGridModeLine => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleLayoutGridModeBoth => 3

    /**
     * @type {Integer (Int32)}
     */
    static styleLayoutGridModeNone => 4

    /**
     * @type {Integer (Int32)}
     */
    static styleLayoutGridMode_Max => 2147483647
}
