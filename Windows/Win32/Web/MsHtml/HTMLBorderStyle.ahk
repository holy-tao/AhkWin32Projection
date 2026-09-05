#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class HTMLBorderStyle extends Win32Enum {

    /**
     * Native name: HTMLBorderStyleNormal
     * @type {Integer (Int32)}
     */
    static Normal => 0

    /**
     * Native name: HTMLBorderStyleRaised
     * @type {Integer (Int32)}
     */
    static Raised => 256

    /**
     * Native name: HTMLBorderStyleSunken
     * @type {Integer (Int32)}
     */
    static Sunken => 512

    /**
     * Native name: HTMLBorderStylecombined
     * @type {Integer (Int32)}
     */
    static Stylecombined => 768

    /**
     * Native name: HTMLBorderStyleStatic
     * @type {Integer (Int32)}
     */
    static Static => 131072

    /**
     * Native name: HTMLBorderStyle_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
