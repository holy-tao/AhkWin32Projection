#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class HTMLWindowState extends Win32Enum {

    /**
     * Native name: HTMLWindowStateNormal
     * @type {Integer (Int32)}
     */
    static Normal => 1

    /**
     * Native name: HTMLWindowStateMaximize
     * @type {Integer (Int32)}
     */
    static Maximize => 3

    /**
     * Native name: HTMLWindowStateMinimize
     * @type {Integer (Int32)}
     */
    static Minimize => 6

    /**
     * Native name: HTMLWindowState_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
