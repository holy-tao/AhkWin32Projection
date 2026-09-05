#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class svgMarkerOrient extends Win32Enum {

    /**
     * Native name: SVG_MARKER_ORIENT_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 0

    /**
     * Native name: SVG_MARKER_ORIENT_AUTO
     * @type {Integer (Int32)}
     */
    static AUTO => 1

    /**
     * Native name: SVG_MARKER_ORIENT_ANGLE
     * @type {Integer (Int32)}
     */
    static ANGLE => 2

    /**
     * Native name: svgMarkerOrient_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
