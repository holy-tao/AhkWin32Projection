#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleInitialColor extends Win32Enum {

    /**
     * Native name: styleInitialColorNoInitial
     * @type {Integer (Int32)}
     */
    static NoInitial => 0

    /**
     * Native name: styleInitialColorColorProperty
     * @type {Integer (Int32)}
     */
    static ColorProperty => 1

    /**
     * Native name: styleInitialColorTransparent
     * @type {Integer (Int32)}
     */
    static Transparent => 2

    /**
     * Native name: styleInitialColorInvert
     * @type {Integer (Int32)}
     */
    static Invert => 3

    /**
     * Native name: styleInitialColor_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
