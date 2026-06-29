#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct htmlCellVAlign {
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
    static htmlCellVAlignNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static htmlCellVAlignTop => 1

    /**
     * @type {Integer (Int32)}
     */
    static htmlCellVAlignMiddle => 2

    /**
     * @type {Integer (Int32)}
     */
    static htmlCellVAlignBottom => 3

    /**
     * @type {Integer (Int32)}
     */
    static htmlCellVAlignBaseline => 4

    /**
     * @type {Integer (Int32)}
     */
    static htmlCellVAlignCenter => 2

    /**
     * @type {Integer (Int32)}
     */
    static htmlCellVAlign_Max => 2147483647
}
