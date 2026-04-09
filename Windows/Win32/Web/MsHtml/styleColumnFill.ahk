#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleColumnFill extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static styleColumnFillAuto => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleColumnFillBalance => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleColumnFillNotSet => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleColumnFill_Max => 2147483647
}
