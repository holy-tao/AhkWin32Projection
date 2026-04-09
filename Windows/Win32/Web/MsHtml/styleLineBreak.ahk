#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleLineBreak extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static styleLineBreakNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleLineBreakNormal => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleLineBreakStrict => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleLineBreak_Max => 2147483647
}
