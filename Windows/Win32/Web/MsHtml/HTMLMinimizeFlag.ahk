#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class HTMLMinimizeFlag extends Win32Enum {

    /**
     * Native name: HTMLMinimizeFlagNo
     * @type {Integer (Int32)}
     */
    static No => 0

    /**
     * Native name: HTMLMinimizeFlagYes
     * @type {Integer (Int32)}
     */
    static Yes => 131072

    /**
     * Native name: HTMLMinimizeFlag_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
