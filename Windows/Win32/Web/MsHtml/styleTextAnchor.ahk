#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleTextAnchor extends Win32Enum {

    /**
     * Native name: styleTextAnchorNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 0

    /**
     * Native name: styleTextAnchorStart
     * @type {Integer (Int32)}
     */
    static Start => 1

    /**
     * Native name: styleTextAnchorMiddle
     * @type {Integer (Int32)}
     */
    static Middle => 2

    /**
     * Native name: styleTextAnchorEnd
     * @type {Integer (Int32)}
     */
    static End => 3

    /**
     * Native name: styleTextAnchor_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
