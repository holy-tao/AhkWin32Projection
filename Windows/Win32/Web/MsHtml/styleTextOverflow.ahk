#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleTextOverflow extends Win32Enum {

    /**
     * Native name: styleTextOverflowClip
     * @type {Integer (Int32)}
     */
    static Clip => 0

    /**
     * Native name: styleTextOverflowEllipsis
     * @type {Integer (Int32)}
     */
    static Ellipsis => 1

    /**
     * Native name: styleTextOverflowNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 2

    /**
     * Native name: styleTextOverflow_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
