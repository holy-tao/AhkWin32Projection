#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class DISPLAY_GRAVITY extends Win32Enum {

    /**
     * Native name: DISPLAY_GRAVITY_PreviousLine
     * @type {Integer (Int32)}
     */
    static PreviousLine => 1

    /**
     * Native name: DISPLAY_GRAVITY_NextLine
     * @type {Integer (Int32)}
     */
    static NextLine => 2

    /**
     * Native name: DISPLAY_GRAVITY_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
