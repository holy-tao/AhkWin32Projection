#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class htmlGlyphMode extends Win32Enum {

    /**
     * Native name: htmlGlyphModeNone
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Native name: htmlGlyphModeBegin
     * @type {Integer (Int32)}
     */
    static Begin => 1

    /**
     * Native name: htmlGlyphModeEnd
     * @type {Integer (Int32)}
     */
    static End => 2

    /**
     * Native name: htmlGlyphModeBoth
     * @type {Integer (Int32)}
     */
    static Both => 3

    /**
     * Native name: htmlGlyphMode_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
