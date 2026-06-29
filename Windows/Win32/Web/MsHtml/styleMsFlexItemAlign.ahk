#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct styleMsFlexItemAlign {
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
    static styleMsFlexItemAlignStart => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleMsFlexItemAlignEnd => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleMsFlexItemAlignCenter => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleMsFlexItemAlignBaseline => 3

    /**
     * @type {Integer (Int32)}
     */
    static styleMsFlexItemAlignStretch => 4

    /**
     * @type {Integer (Int32)}
     */
    static styleMsFlexItemAlignAuto => 5

    /**
     * @type {Integer (Int32)}
     */
    static styleMsFlexItemAlignNotSet => 6

    /**
     * @type {Integer (Int32)}
     */
    static styleMsFlexItemAlign_Max => 2147483647
}
