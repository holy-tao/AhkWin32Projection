#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class styleWordWrap extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static styleWordWrapNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleWordWrapOff => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleWordWrapOn => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleWordWrap_Max => 2147483647
}
