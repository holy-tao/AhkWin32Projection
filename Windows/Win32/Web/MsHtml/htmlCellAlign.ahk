#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct htmlCellAlign {
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
    static htmlCellAlignNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static htmlCellAlignLeft => 1

    /**
     * @type {Integer (Int32)}
     */
    static htmlCellAlignCenter => 2

    /**
     * @type {Integer (Int32)}
     */
    static htmlCellAlignRight => 3

    /**
     * @type {Integer (Int32)}
     */
    static htmlCellAlignMiddle => 2

    /**
     * @type {Integer (Int32)}
     */
    static htmlCellAlign_Max => 2147483647
}
