#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class HTML_PAINT_EVENT_FLAGS extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static HTMLPAINT_EVENT_TARGET => 1

    /**
     * @type {Integer (Int32)}
     */
    static HTMLPAINT_EVENT_SETCURSOR => 2

    /**
     * @type {Integer (Int32)}
     */
    static HTML_PAINT_EVENT_FLAGS_Max => 2147483647
}
