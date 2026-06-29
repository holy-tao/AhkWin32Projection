#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct styleOverflow {
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
    static styleOverflowNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleOverflowAuto => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleOverflowHidden => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleOverflowVisible => 3

    /**
     * @type {Integer (Int32)}
     */
    static styleOverflowScroll => 4

    /**
     * @type {Integer (Int32)}
     */
    static styleOverflow_Max => 2147483647
}
