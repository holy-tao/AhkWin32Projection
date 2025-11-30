#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class ELEMENT_CORNER extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ELEMENT_CORNER_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static ELEMENT_CORNER_TOP => 1

    /**
     * @type {Integer (Int32)}
     */
    static ELEMENT_CORNER_LEFT => 2

    /**
     * @type {Integer (Int32)}
     */
    static ELEMENT_CORNER_BOTTOM => 3

    /**
     * @type {Integer (Int32)}
     */
    static ELEMENT_CORNER_RIGHT => 4

    /**
     * @type {Integer (Int32)}
     */
    static ELEMENT_CORNER_TOPLEFT => 5

    /**
     * @type {Integer (Int32)}
     */
    static ELEMENT_CORNER_TOPRIGHT => 6

    /**
     * @type {Integer (Int32)}
     */
    static ELEMENT_CORNER_BOTTOMLEFT => 7

    /**
     * @type {Integer (Int32)}
     */
    static ELEMENT_CORNER_BOTTOMRIGHT => 8

    /**
     * @type {Integer (Int32)}
     */
    static ELEMENT_CORNER_Max => 2147483647
}
