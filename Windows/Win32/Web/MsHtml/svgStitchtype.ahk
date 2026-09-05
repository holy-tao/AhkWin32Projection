#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class svgStitchtype extends Win32Enum {

    /**
     * Native name: SVG_STITCHTYPE_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 0

    /**
     * Native name: SVG_STITCHTYPE_STITCH
     * @type {Integer (Int32)}
     */
    static STITCH => 1

    /**
     * Native name: SVG_STITCHTYPE_NOSTITCH
     * @type {Integer (Int32)}
     */
    static NOSTITCH => 2

    /**
     * Native name: svgStitchtype_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
