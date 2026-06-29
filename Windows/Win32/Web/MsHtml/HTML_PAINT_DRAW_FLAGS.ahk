#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct HTML_PAINT_DRAW_FLAGS {
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
    static HTMLPAINT_DRAW_UPDATEREGION => 1

    /**
     * @type {Integer (Int32)}
     */
    static HTMLPAINT_DRAW_USE_XFORM => 2

    /**
     * @type {Integer (Int32)}
     */
    static HTML_PAINT_DRAW_FLAGS_Max => 2147483647
}
