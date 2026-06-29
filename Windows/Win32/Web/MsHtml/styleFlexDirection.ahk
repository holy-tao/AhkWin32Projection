#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct styleFlexDirection {
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
    static styleFlexDirectionRow => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleFlexDirectionRowReverse => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleFlexDirectionColumn => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleFlexDirectionColumnReverse => 3

    /**
     * @type {Integer (Int32)}
     */
    static styleFlexDirectionNotSet => 4

    /**
     * @type {Integer (Int32)}
     */
    static styleFlexDirection_Max => 2147483647
}
