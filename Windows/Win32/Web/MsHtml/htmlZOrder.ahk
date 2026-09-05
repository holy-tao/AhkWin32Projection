#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class htmlZOrder extends Win32Enum {

    /**
     * Native name: htmlZOrderFront
     * @type {Integer (Int32)}
     */
    static Front => 0

    /**
     * Native name: htmlZOrderBack
     * @type {Integer (Int32)}
     */
    static Back => 1

    /**
     * Native name: htmlZOrder_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
