#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class LINE_DIRECTION extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static LINE_DIRECTION_RightToLeft => 1

    /**
     * @type {Integer (Int32)}
     */
    static LINE_DIRECTION_LeftToRight => 2

    /**
     * @type {Integer (Int32)}
     */
    static LINE_DIRECTION_Max => 2147483647
}
