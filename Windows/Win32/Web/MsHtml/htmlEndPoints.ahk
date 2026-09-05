#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class htmlEndPoints extends Win32Enum {

    /**
     * Native name: htmlEndPointsStartToStart
     * @type {Integer (Int32)}
     */
    static StartToStart => 1

    /**
     * Native name: htmlEndPointsStartToEnd
     * @type {Integer (Int32)}
     */
    static StartToEnd => 2

    /**
     * Native name: htmlEndPointsEndToStart
     * @type {Integer (Int32)}
     */
    static EndToStart => 3

    /**
     * Native name: htmlEndPointsEndToEnd
     * @type {Integer (Int32)}
     */
    static EndToEnd => 4

    /**
     * Native name: htmlEndPoints_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
