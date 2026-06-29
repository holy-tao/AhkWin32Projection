#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct styleJustifyContent {
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
    static styleJustifyContentFlexStart => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleJustifyContentFlexEnd => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleJustifyContentCenter => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleJustifyContentSpaceBetween => 3

    /**
     * @type {Integer (Int32)}
     */
    static styleJustifyContentSpaceAround => 4

    /**
     * @type {Integer (Int32)}
     */
    static styleJustifyContentNotSet => 5

    /**
     * @type {Integer (Int32)}
     */
    static styleJustifyContent_Max => 2147483647
}
