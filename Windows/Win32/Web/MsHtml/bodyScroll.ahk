#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct bodyScroll {
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
    static bodyScrollyes => 1

    /**
     * @type {Integer (Int32)}
     */
    static bodyScrollno => 2

    /**
     * @type {Integer (Int32)}
     */
    static bodyScrollauto => 4

    /**
     * @type {Integer (Int32)}
     */
    static bodyScrolldefault => 3

    /**
     * @type {Integer (Int32)}
     */
    static bodyScroll_Max => 2147483647
}
