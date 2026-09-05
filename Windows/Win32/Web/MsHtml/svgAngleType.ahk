#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class svgAngleType extends Win32Enum {

    /**
     * Native name: SVG_ANGLETYPE_UNKNOWN
     * @type {Integer (Int32)}
     */
    static ANGLETYPE_UNKNOWN => 0

    /**
     * Native name: SVG_ANGLETYPE_UNSPECIFIED
     * @type {Integer (Int32)}
     */
    static ANGLETYPE_UNSPECIFIED => 1

    /**
     * Native name: SVG_ANGLETYPE_DEG
     * @type {Integer (Int32)}
     */
    static ANGLETYPE_DEG => 2

    /**
     * Native name: SVG_ANGLETYPE_RAD
     * @type {Integer (Int32)}
     */
    static ANGLETYPE_RAD => 3

    /**
     * Native name: SVG_ANGLETYPE_GRAD
     * @type {Integer (Int32)}
     */
    static ANGLETYPE_GRAD => 4

    /**
     * Native name: svgAngleType_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
