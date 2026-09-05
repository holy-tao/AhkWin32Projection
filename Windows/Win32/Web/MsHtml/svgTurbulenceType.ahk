#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class svgTurbulenceType extends Win32Enum {

    /**
     * Native name: SVG_TURBULENCE_TYPE_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 0

    /**
     * Native name: SVG_TURBULENCE_TYPE_FACTALNOISE
     * @type {Integer (Int32)}
     */
    static FACTALNOISE => 1

    /**
     * Native name: SVG_TURBULENCE_TYPE_TURBULENCE
     * @type {Integer (Int32)}
     */
    static TURBULENCE => 2

    /**
     * Native name: svgTurbulenceType_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
