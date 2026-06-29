#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct styleTextAlignLast {
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
    static styleTextAlignLastNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleTextAlignLastLeft => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleTextAlignLastCenter => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleTextAlignLastRight => 3

    /**
     * @type {Integer (Int32)}
     */
    static styleTextAlignLastJustify => 4

    /**
     * @type {Integer (Int32)}
     */
    static styleTextAlignLastAuto => 5

    /**
     * @type {Integer (Int32)}
     */
    static styleTextAlignLast_Max => 2147483647
}
