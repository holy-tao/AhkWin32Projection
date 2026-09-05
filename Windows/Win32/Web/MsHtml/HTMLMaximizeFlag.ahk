#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class HTMLMaximizeFlag extends Win32Enum {

    /**
     * Native name: HTMLMaximizeFlagNo
     * @type {Integer (Int32)}
     */
    static No => 0

    /**
     * Native name: HTMLMaximizeFlagYes
     * @type {Integer (Int32)}
     */
    static Yes => 65536

    /**
     * Native name: HTMLMaximizeFlag_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
