#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct styleFlexWrap {
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
    static styleFlexWrapNowrap => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleFlexWrapWrap => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleFlexWrapWrapReverse => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleFlexWrapNotSet => 3

    /**
     * @type {Integer (Int32)}
     */
    static styleFlexWrap_Max => 2147483647
}
