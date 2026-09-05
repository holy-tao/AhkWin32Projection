#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleLayoutGridLine extends Win32Enum {

    /**
     * Native name: styleLayoutGridLineNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 0

    /**
     * Native name: styleLayoutGridLineAuto
     * @type {Integer (Int32)}
     */
    static Auto => 1

    /**
     * Native name: styleLayoutGridLineNone
     * @type {Integer (Int32)}
     */
    static None => 2

    /**
     * Native name: styleLayoutGridLine_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
