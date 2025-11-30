#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class styleStrokeLinecap extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static styleStrokeLinecapNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleStrokeLinecapButt => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleStrokeLinecapRound => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleStrokeLinecapSquare => 3

    /**
     * @type {Integer (Int32)}
     */
    static styleStrokeLinecap_Max => 2147483647
}
