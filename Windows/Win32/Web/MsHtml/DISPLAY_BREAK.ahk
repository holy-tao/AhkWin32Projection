#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class DISPLAY_BREAK extends Win32Enum {

    /**
     * Native name: DISPLAY_BREAK_None
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Native name: DISPLAY_BREAK_Block
     * @type {Integer (Int32)}
     */
    static Block => 1

    /**
     * Native name: DISPLAY_BREAK_Break
     * @type {Integer (Int32)}
     */
    static Break => 2

    /**
     * Native name: DISPLAY_BREAK_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
