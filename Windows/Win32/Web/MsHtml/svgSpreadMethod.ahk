#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class svgSpreadMethod extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static SVG_SPREADMETHOD_UNKNOWN => 0

    /**
     * @type {Integer (Int32)}
     */
    static SVG_SPREADMETHOD_PAD => 1

    /**
     * @type {Integer (Int32)}
     */
    static SVG_SPREADMETHOD_REFLECT => 2

    /**
     * @type {Integer (Int32)}
     */
    static SVG_SPREADMETHOD_REPEAT => 3

    /**
     * @type {Integer (Int32)}
     */
    static svgSpreadMethod_Max => 2147483647
}
