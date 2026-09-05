#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class svgEdgemode extends Win32Enum {

    /**
     * Native name: SVG_EDGEMODE_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 0

    /**
     * Native name: SVG_EDGEMODE_DUPLICATE
     * @type {Integer (Int32)}
     */
    static DUPLICATE => 1

    /**
     * Native name: SVG_EDGEMODE_WRAP
     * @type {Integer (Int32)}
     */
    static WRAP => 2

    /**
     * Native name: SVG_EDGEMODE_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 3

    /**
     * Native name: svgEdgemode_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
