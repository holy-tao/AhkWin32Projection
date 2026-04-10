#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class svgUnitTypes extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static SVG_UNITTYPE_UNKNOWN => 0

    /**
     * @type {Integer (Int32)}
     */
    static SVG_UNITTYPE_USERSPACEONUSE => 1

    /**
     * @type {Integer (Int32)}
     */
    static SVG_UNITTYPE_OBJECTBOUNDINGBOX => 2

    /**
     * @type {Integer (Int32)}
     */
    static svgUnitTypes_Max => 2147483647
}
