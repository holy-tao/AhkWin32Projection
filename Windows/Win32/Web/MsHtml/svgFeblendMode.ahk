#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class svgFeblendMode extends Win32Enum {

    /**
     * Native name: SVG_FEBLEND_MODE_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 0

    /**
     * Native name: SVG_FEBLEND_MODE_NORMAL
     * @type {Integer (Int32)}
     */
    static NORMAL => 1

    /**
     * Native name: SVG_FEBLEND_MODE_MULTIPLY
     * @type {Integer (Int32)}
     */
    static MULTIPLY => 2

    /**
     * Native name: SVG_FEBLEND_MODE_SCREEN
     * @type {Integer (Int32)}
     */
    static SCREEN => 3

    /**
     * Native name: SVG_FEBLEND_MODE_DARKEN
     * @type {Integer (Int32)}
     */
    static DARKEN => 4

    /**
     * Native name: SVG_FEBLEND_MODE_LIGHTEN
     * @type {Integer (Int32)}
     */
    static LIGHTEN => 5

    /**
     * Native name: svgFeblendMode_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
