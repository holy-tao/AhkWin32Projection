#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class HTMLDlgBorder extends Win32Enum {

    /**
     * Native name: HTMLDlgBorderThin
     * @type {Integer (Int32)}
     */
    static Thin => 0

    /**
     * Native name: HTMLDlgBorderThick
     * @type {Integer (Int32)}
     */
    static Thick => 262144

    /**
     * Native name: HTMLDlgBorder_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
