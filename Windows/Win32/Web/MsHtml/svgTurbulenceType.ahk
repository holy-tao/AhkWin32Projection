#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class svgTurbulenceType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SVG_TURBULENCE_TYPE_UNKNOWN => 0

    /**
     * @type {Integer (Int32)}
     */
    static SVG_TURBULENCE_TYPE_FACTALNOISE => 1

    /**
     * @type {Integer (Int32)}
     */
    static SVG_TURBULENCE_TYPE_TURBULENCE => 2

    /**
     * @type {Integer (Int32)}
     */
    static svgTurbulenceType_Max => 2147483647
}
