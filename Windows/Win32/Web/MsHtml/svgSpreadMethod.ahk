#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class svgSpreadMethod extends Win32Enum {

    /**
     * Native name: SVG_SPREADMETHOD_UNKNOWN
     * @type {Integer (Int32)}
     */
    static SPREADMETHOD_UNKNOWN => 0

    /**
     * Native name: SVG_SPREADMETHOD_PAD
     * @type {Integer (Int32)}
     */
    static SPREADMETHOD_PAD => 1

    /**
     * Native name: SVG_SPREADMETHOD_REFLECT
     * @type {Integer (Int32)}
     */
    static SPREADMETHOD_REFLECT => 2

    /**
     * Native name: SVG_SPREADMETHOD_REPEAT
     * @type {Integer (Int32)}
     */
    static SPREADMETHOD_REPEAT => 3

    /**
     * Native name: svgSpreadMethod_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
