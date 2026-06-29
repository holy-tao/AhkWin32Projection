#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct HTML_PAINT_DRAW_INFO_FLAGS {
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
    static HTMLPAINT_DRAWINFO_VIEWPORT => 1

    /**
     * @type {Integer (Int32)}
     */
    static HTMLPAINT_DRAWINFO_UPDATEREGION => 2

    /**
     * @type {Integer (Int32)}
     */
    static HTMLPAINT_DRAWINFO_XFORM => 4

    /**
     * @type {Integer (Int32)}
     */
    static HTML_PAINT_DRAW_INFO_FLAGS_Max => 2147483647
}
