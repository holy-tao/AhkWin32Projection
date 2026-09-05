#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class VIEW_OBJECT_ALPHA_MODE extends Win32Enum {

    /**
     * Native name: VIEW_OBJECT_ALPHA_MODE_IGNORE
     * @type {Integer (Int32)}
     */
    static IGNORE => 0

    /**
     * Native name: VIEW_OBJECT_ALPHA_MODE_PREMULTIPLIED
     * @type {Integer (Int32)}
     */
    static PREMULTIPLIED => 1

    /**
     * Native name: VIEW_OBJECT_ALPHA_MODE_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
