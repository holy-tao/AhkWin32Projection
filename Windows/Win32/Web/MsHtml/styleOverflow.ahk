#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleOverflow extends Win32Enum {

    /**
     * Native name: styleOverflowNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 0

    /**
     * Native name: styleOverflowAuto
     * @type {Integer (Int32)}
     */
    static Auto => 1

    /**
     * Native name: styleOverflowHidden
     * @type {Integer (Int32)}
     */
    static Hidden => 2

    /**
     * Native name: styleOverflowVisible
     * @type {Integer (Int32)}
     */
    static Visible => 3

    /**
     * Native name: styleOverflowScroll
     * @type {Integer (Int32)}
     */
    static Scroll => 4

    /**
     * Native name: styleOverflow_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
