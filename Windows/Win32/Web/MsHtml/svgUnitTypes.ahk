#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class svgUnitTypes extends Win32Enum {

    /**
     * Native name: SVG_UNITTYPE_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNITTYPE_UNKNOWN => 0

    /**
     * Native name: SVG_UNITTYPE_USERSPACEONUSE
     * @type {Integer (Int32)}
     */
    static UNITTYPE_USERSPACEONUSE => 1

    /**
     * Native name: SVG_UNITTYPE_OBJECTBOUNDINGBOX
     * @type {Integer (Int32)}
     */
    static UNITTYPE_OBJECTBOUNDINGBOX => 2

    /**
     * Native name: svgUnitTypes_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
