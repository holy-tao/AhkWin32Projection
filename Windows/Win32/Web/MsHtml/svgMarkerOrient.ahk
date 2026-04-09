#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class svgMarkerOrient extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static SVG_MARKER_ORIENT_UNKNOWN => 0

    /**
     * @type {Integer (Int32)}
     */
    static SVG_MARKER_ORIENT_AUTO => 1

    /**
     * @type {Integer (Int32)}
     */
    static SVG_MARKER_ORIENT_ANGLE => 2

    /**
     * @type {Integer (Int32)}
     */
    static svgMarkerOrient_Max => 2147483647
}
