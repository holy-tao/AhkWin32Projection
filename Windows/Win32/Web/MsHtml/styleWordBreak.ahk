#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class styleWordBreak extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static styleWordBreakNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleWordBreakNormal => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleWordBreakBreakAll => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleWordBreakKeepAll => 3

    /**
     * @type {Integer (Int32)}
     */
    static styleWordBreak_Max => 2147483647
}
