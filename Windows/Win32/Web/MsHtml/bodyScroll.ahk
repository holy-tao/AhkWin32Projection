#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class bodyScroll extends Win32Enum {

    /**
     * Native name: bodyScrollyes
     * @type {Integer (Int32)}
     */
    static Scrollyes => 1

    /**
     * Native name: bodyScrollno
     * @type {Integer (Int32)}
     */
    static Scrollno => 2

    /**
     * Native name: bodyScrollauto
     * @type {Integer (Int32)}
     */
    static Scrollauto => 4

    /**
     * Native name: bodyScrolldefault
     * @type {Integer (Int32)}
     */
    static Scrolldefault => 3

    /**
     * Native name: bodyScroll_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
