#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct styleMsImeAlign {
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
    static styleMsImeAlignAuto => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleMsImeAlignAfter => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleMsImeAlignNotSet => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleMsImeAlign_Max => 2147483647
}
