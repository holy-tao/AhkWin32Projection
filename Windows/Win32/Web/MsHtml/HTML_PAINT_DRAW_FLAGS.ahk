#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class HTML_PAINT_DRAW_FLAGS extends Win32Enum{

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
