#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class svgPreserveAlpha extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SVG_PRESERVEALPHA_FALSE => 0

    /**
     * @type {Integer (Int32)}
     */
    static SVG_PRESERVEALPHA_TRUE => 1

    /**
     * @type {Integer (Int32)}
     */
    static svgPreserveAlpha_Max => 2147483647
}
