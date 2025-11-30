#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class svgAngleType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SVG_ANGLETYPE_UNKNOWN => 0

    /**
     * @type {Integer (Int32)}
     */
    static SVG_ANGLETYPE_UNSPECIFIED => 1

    /**
     * @type {Integer (Int32)}
     */
    static SVG_ANGLETYPE_DEG => 2

    /**
     * @type {Integer (Int32)}
     */
    static SVG_ANGLETYPE_RAD => 3

    /**
     * @type {Integer (Int32)}
     */
    static SVG_ANGLETYPE_GRAD => 4

    /**
     * @type {Integer (Int32)}
     */
    static svgAngleType_Max => 2147483647
}
