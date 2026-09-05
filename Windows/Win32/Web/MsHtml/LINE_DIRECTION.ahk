#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class LINE_DIRECTION extends Win32Enum {

    /**
     * Native name: LINE_DIRECTION_RightToLeft
     * @type {Integer (Int32)}
     */
    static RightToLeft => 1

    /**
     * Native name: LINE_DIRECTION_LeftToRight
     * @type {Integer (Int32)}
     */
    static LeftToRight => 2

    /**
     * Native name: LINE_DIRECTION_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
