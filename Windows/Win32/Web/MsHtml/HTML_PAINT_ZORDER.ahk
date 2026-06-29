#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct HTML_PAINT_ZORDER {
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
    static HTMLPAINT_ZORDER_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static HTMLPAINT_ZORDER_REPLACE_ALL => 1

    /**
     * @type {Integer (Int32)}
     */
    static HTMLPAINT_ZORDER_REPLACE_CONTENT => 2

    /**
     * @type {Integer (Int32)}
     */
    static HTMLPAINT_ZORDER_REPLACE_BACKGROUND => 3

    /**
     * @type {Integer (Int32)}
     */
    static HTMLPAINT_ZORDER_BELOW_CONTENT => 4

    /**
     * @type {Integer (Int32)}
     */
    static HTMLPAINT_ZORDER_BELOW_FLOW => 5

    /**
     * @type {Integer (Int32)}
     */
    static HTMLPAINT_ZORDER_ABOVE_FLOW => 6

    /**
     * @type {Integer (Int32)}
     */
    static HTMLPAINT_ZORDER_ABOVE_CONTENT => 7

    /**
     * @type {Integer (Int32)}
     */
    static HTMLPAINT_ZORDER_WINDOW_TOP => 8

    /**
     * @type {Integer (Int32)}
     */
    static HTML_PAINT_ZORDER_Max => 2147483647
}
