#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct styleMsFlexLinePack {
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
    static styleMsFlexLinePackStart => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleMsFlexLinePackEnd => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleMsFlexLinePackCenter => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleMsFlexLinePackJustify => 3

    /**
     * @type {Integer (Int32)}
     */
    static styleMsFlexLinePackDistribute => 4

    /**
     * @type {Integer (Int32)}
     */
    static styleMsFlexLinePackStretch => 5

    /**
     * @type {Integer (Int32)}
     */
    static styleMsFlexLinePackNotSet => 6

    /**
     * @type {Integer (Int32)}
     */
    static styleMsFlexLinePack_Max => 2147483647
}
