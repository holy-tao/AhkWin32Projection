#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleStrokeLinecap extends Win32Enum {

    /**
     * Native name: styleStrokeLinecapNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 0

    /**
     * Native name: styleStrokeLinecapButt
     * @type {Integer (Int32)}
     */
    static Butt => 1

    /**
     * Native name: styleStrokeLinecapRound
     * @type {Integer (Int32)}
     */
    static Round => 2

    /**
     * Native name: styleStrokeLinecapSquare
     * @type {Integer (Int32)}
     */
    static Square => 3

    /**
     * Native name: styleStrokeLinecap_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
