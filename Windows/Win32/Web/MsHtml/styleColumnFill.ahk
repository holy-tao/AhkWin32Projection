#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleColumnFill extends Win32Enum {

    /**
     * Native name: styleColumnFillAuto
     * @type {Integer (Int32)}
     */
    static Auto => 0

    /**
     * Native name: styleColumnFillBalance
     * @type {Integer (Int32)}
     */
    static Balance => 1

    /**
     * Native name: styleColumnFillNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 2

    /**
     * Native name: styleColumnFill_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
