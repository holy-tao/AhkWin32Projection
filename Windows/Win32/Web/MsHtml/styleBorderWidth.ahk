#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleBorderWidth extends Win32Enum {

    /**
     * Native name: styleBorderWidthThin
     * @type {Integer (Int32)}
     */
    static Thin => 0

    /**
     * Native name: styleBorderWidthMedium
     * @type {Integer (Int32)}
     */
    static Medium => 1

    /**
     * Native name: styleBorderWidthThick
     * @type {Integer (Int32)}
     */
    static Thick => 2

    /**
     * Native name: styleBorderWidth_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
