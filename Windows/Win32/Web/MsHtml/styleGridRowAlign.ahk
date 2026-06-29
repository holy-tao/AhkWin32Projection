#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct styleGridRowAlign {
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
    static styleGridRowAlignCenter => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleGridRowAlignEnd => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleGridRowAlignStart => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleGridRowAlignStretch => 3

    /**
     * @type {Integer (Int32)}
     */
    static styleGridRowAlignNotSet => 4

    /**
     * @type {Integer (Int32)}
     */
    static styleGridRowAlign_Max => 2147483647
}
