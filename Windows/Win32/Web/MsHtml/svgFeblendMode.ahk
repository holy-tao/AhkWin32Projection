#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class svgFeblendMode extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SVG_FEBLEND_MODE_UNKNOWN => 0

    /**
     * @type {Integer (Int32)}
     */
    static SVG_FEBLEND_MODE_NORMAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static SVG_FEBLEND_MODE_MULTIPLY => 2

    /**
     * @type {Integer (Int32)}
     */
    static SVG_FEBLEND_MODE_SCREEN => 3

    /**
     * @type {Integer (Int32)}
     */
    static SVG_FEBLEND_MODE_DARKEN => 4

    /**
     * @type {Integer (Int32)}
     */
    static SVG_FEBLEND_MODE_LIGHTEN => 5

    /**
     * @type {Integer (Int32)}
     */
    static svgFeblendMode_Max => 2147483647
}
