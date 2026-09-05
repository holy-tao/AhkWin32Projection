#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class svgPreserveAspectMeetOrSliceType extends Win32Enum {

    /**
     * Native name: SVG_MEETORSLICE_UNKNOWN
     * @type {Integer (Int32)}
     */
    static MEETORSLICE_UNKNOWN => 0

    /**
     * Native name: SVG_MEETORSLICE_MEET
     * @type {Integer (Int32)}
     */
    static MEETORSLICE_MEET => 1

    /**
     * Native name: SVG_MEETORSLICE_SLICE
     * @type {Integer (Int32)}
     */
    static MEETORSLICE_SLICE => 2

    /**
     * Native name: svgPreserveAspectMeetOrSliceType_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
