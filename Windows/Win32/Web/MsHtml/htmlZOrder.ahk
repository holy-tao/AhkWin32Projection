#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class htmlZOrder extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static htmlZOrderFront => 0

    /**
     * @type {Integer (Int32)}
     */
    static htmlZOrderBack => 1

    /**
     * @type {Integer (Int32)}
     */
    static htmlZOrder_Max => 2147483647
}
