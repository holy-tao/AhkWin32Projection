#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class styleOverflow extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static styleOverflowNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleOverflowAuto => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleOverflowHidden => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleOverflowVisible => 3

    /**
     * @type {Integer (Int32)}
     */
    static styleOverflowScroll => 4

    /**
     * @type {Integer (Int32)}
     */
    static styleOverflow_Max => 2147483647
}
