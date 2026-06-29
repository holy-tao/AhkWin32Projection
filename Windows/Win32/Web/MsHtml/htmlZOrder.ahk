#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct htmlZOrder {
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
    static htmlZOrderFront => 0

    /**
     * @type {Integer (Int32)}
     */
    static htmlZOrderBack => 1

    /**
     * @type {Integer (Int32)}
     */
    static htmlZOrder_Max => 2147483647
}
