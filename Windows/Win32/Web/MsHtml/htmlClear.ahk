#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct htmlClear {
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
    static htmlClearNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static htmlClearAll => 1

    /**
     * @type {Integer (Int32)}
     */
    static htmlClearLeft => 2

    /**
     * @type {Integer (Int32)}
     */
    static htmlClearRight => 3

    /**
     * @type {Integer (Int32)}
     */
    static htmlClearBoth => 4

    /**
     * @type {Integer (Int32)}
     */
    static htmlClearNone => 5

    /**
     * @type {Integer (Int32)}
     */
    static htmlClear_Max => 2147483647
}
