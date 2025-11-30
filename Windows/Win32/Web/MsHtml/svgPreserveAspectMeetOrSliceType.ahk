#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class svgPreserveAspectMeetOrSliceType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SVG_MEETORSLICE_UNKNOWN => 0

    /**
     * @type {Integer (Int32)}
     */
    static SVG_MEETORSLICE_MEET => 1

    /**
     * @type {Integer (Int32)}
     */
    static SVG_MEETORSLICE_SLICE => 2

    /**
     * @type {Integer (Int32)}
     */
    static svgPreserveAspectMeetOrSliceType_Max => 2147483647
}
