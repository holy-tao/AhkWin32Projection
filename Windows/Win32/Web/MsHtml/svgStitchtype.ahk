#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class svgStitchtype extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SVG_STITCHTYPE_UNKNOWN => 0

    /**
     * @type {Integer (Int32)}
     */
    static SVG_STITCHTYPE_STITCH => 1

    /**
     * @type {Integer (Int32)}
     */
    static SVG_STITCHTYPE_NOSTITCH => 2

    /**
     * @type {Integer (Int32)}
     */
    static svgStitchtype_Max => 2147483647
}
