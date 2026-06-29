#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct ELEMENT_CORNER {
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
    static ELEMENT_CORNER_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static ELEMENT_CORNER_TOP => 1

    /**
     * @type {Integer (Int32)}
     */
    static ELEMENT_CORNER_LEFT => 2

    /**
     * @type {Integer (Int32)}
     */
    static ELEMENT_CORNER_BOTTOM => 3

    /**
     * @type {Integer (Int32)}
     */
    static ELEMENT_CORNER_RIGHT => 4

    /**
     * @type {Integer (Int32)}
     */
    static ELEMENT_CORNER_TOPLEFT => 5

    /**
     * @type {Integer (Int32)}
     */
    static ELEMENT_CORNER_TOPRIGHT => 6

    /**
     * @type {Integer (Int32)}
     */
    static ELEMENT_CORNER_BOTTOMLEFT => 7

    /**
     * @type {Integer (Int32)}
     */
    static ELEMENT_CORNER_BOTTOMRIGHT => 8

    /**
     * @type {Integer (Int32)}
     */
    static ELEMENT_CORNER_Max => 2147483647
}
