#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class frameScrolling extends Win32Enum {

    /**
     * Native name: frameScrollingyes
     * @type {Integer (Int32)}
     */
    static Scrollingyes => 1

    /**
     * Native name: frameScrollingno
     * @type {Integer (Int32)}
     */
    static Scrollingno => 2

    /**
     * Native name: frameScrollingauto
     * @type {Integer (Int32)}
     */
    static Scrollingauto => 4

    /**
     * Native name: frameScrolling_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
