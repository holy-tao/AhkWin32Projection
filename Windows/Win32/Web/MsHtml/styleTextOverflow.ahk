#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleTextOverflow extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static styleTextOverflowClip => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleTextOverflowEllipsis => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleTextOverflowNotSet => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleTextOverflow_Max => 2147483647
}
