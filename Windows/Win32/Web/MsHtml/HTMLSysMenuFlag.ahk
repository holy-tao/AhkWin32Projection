#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class HTMLSysMenuFlag extends Win32Enum {

    /**
     * Native name: HTMLSysMenuFlagNo
     * @type {Integer (Int32)}
     */
    static No => 0

    /**
     * Native name: HTMLSysMenuFlagYes
     * @type {Integer (Int32)}
     */
    static Yes => 524288

    /**
     * Native name: HTMLSysMenuFlag_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
