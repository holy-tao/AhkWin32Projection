#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class HTMLBorder extends Win32Enum {

    /**
     * Native name: HTMLBorderNone
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Native name: HTMLBorderThick
     * @type {Integer (Int32)}
     */
    static Thick => 262144

    /**
     * Native name: HTMLBorderDialog
     * @type {Integer (Int32)}
     */
    static Dialog => 4194304

    /**
     * Native name: HTMLBorderThin
     * @type {Integer (Int32)}
     */
    static Thin => 8388608

    /**
     * Native name: HTMLBorder_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
