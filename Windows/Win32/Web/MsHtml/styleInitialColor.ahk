#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleInitialColor extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static styleInitialColorNoInitial => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleInitialColorColorProperty => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleInitialColorTransparent => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleInitialColorInvert => 3

    /**
     * @type {Integer (Int32)}
     */
    static styleInitialColor_Max => 2147483647
}
