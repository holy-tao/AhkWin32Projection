#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct styleAlignContent {
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
    static styleAlignContentFlexStart => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleAlignContentFlexEnd => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleAlignContentCenter => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleAlignContentSpaceBetween => 3

    /**
     * @type {Integer (Int32)}
     */
    static styleAlignContentSpaceAround => 4

    /**
     * @type {Integer (Int32)}
     */
    static styleAlignContentStretch => 5

    /**
     * @type {Integer (Int32)}
     */
    static styleAlignContentNotSet => 6

    /**
     * @type {Integer (Int32)}
     */
    static styleAlignContent_Max => 2147483647
}
