#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class styleTextAnchor extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static styleTextAnchorNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleTextAnchorStart => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleTextAnchorMiddle => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleTextAnchorEnd => 3

    /**
     * @type {Integer (Int32)}
     */
    static styleTextAnchor_Max => 2147483647
}
