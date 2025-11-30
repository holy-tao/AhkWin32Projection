#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class svgEdgemode extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SVG_EDGEMODE_UNKNOWN => 0

    /**
     * @type {Integer (Int32)}
     */
    static SVG_EDGEMODE_DUPLICATE => 1

    /**
     * @type {Integer (Int32)}
     */
    static SVG_EDGEMODE_WRAP => 2

    /**
     * @type {Integer (Int32)}
     */
    static SVG_EDGEMODE_NONE => 3

    /**
     * @type {Integer (Int32)}
     */
    static svgEdgemode_Max => 2147483647
}
