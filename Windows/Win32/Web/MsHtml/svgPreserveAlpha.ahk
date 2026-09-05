#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class svgPreserveAlpha extends Win32Enum {

    /**
     * Native name: SVG_PRESERVEALPHA_FALSE
     * @type {Integer (Int32)}
     */
    static PRESERVEALPHA_FALSE => 0

    /**
     * Native name: SVG_PRESERVEALPHA_TRUE
     * @type {Integer (Int32)}
     */
    static PRESERVEALPHA_TRUE => 1

    /**
     * Native name: svgPreserveAlpha_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
