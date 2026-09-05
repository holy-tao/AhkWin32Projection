#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class svgMarkerUnits extends Win32Enum {

    /**
     * Native name: SVG_MARKERUNITS_UNKNOWN
     * @type {Integer (Int32)}
     */
    static MARKERUNITS_UNKNOWN => 0

    /**
     * Native name: SVG_MARKERUNITS_USERSPACEONUSE
     * @type {Integer (Int32)}
     */
    static MARKERUNITS_USERSPACEONUSE => 1

    /**
     * Native name: SVG_MARKERUNITS_STROKEWIDTH
     * @type {Integer (Int32)}
     */
    static MARKERUNITS_STROKEWIDTH => 2

    /**
     * Native name: svgMarkerUnits_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
