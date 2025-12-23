#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class DISPLAY_BREAK extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DISPLAY_BREAK_None => 0

    /**
     * @type {Integer (Int32)}
     */
    static DISPLAY_BREAK_Block => 1

    /**
     * @type {Integer (Int32)}
     */
    static DISPLAY_BREAK_Break => 2

    /**
     * @type {Integer (Int32)}
     */
    static DISPLAY_BREAK_Max => 2147483647
}
