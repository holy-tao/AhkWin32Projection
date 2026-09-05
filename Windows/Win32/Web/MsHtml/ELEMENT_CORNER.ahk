#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class ELEMENT_CORNER extends Win32Enum {

    /**
     * Native name: ELEMENT_CORNER_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Native name: ELEMENT_CORNER_TOP
     * @type {Integer (Int32)}
     */
    static TOP => 1

    /**
     * Native name: ELEMENT_CORNER_LEFT
     * @type {Integer (Int32)}
     */
    static LEFT => 2

    /**
     * Native name: ELEMENT_CORNER_BOTTOM
     * @type {Integer (Int32)}
     */
    static BOTTOM => 3

    /**
     * Native name: ELEMENT_CORNER_RIGHT
     * @type {Integer (Int32)}
     */
    static RIGHT => 4

    /**
     * Native name: ELEMENT_CORNER_TOPLEFT
     * @type {Integer (Int32)}
     */
    static TOPLEFT => 5

    /**
     * Native name: ELEMENT_CORNER_TOPRIGHT
     * @type {Integer (Int32)}
     */
    static TOPRIGHT => 6

    /**
     * Native name: ELEMENT_CORNER_BOTTOMLEFT
     * @type {Integer (Int32)}
     */
    static BOTTOMLEFT => 7

    /**
     * Native name: ELEMENT_CORNER_BOTTOMRIGHT
     * @type {Integer (Int32)}
     */
    static BOTTOMRIGHT => 8

    /**
     * Native name: ELEMENT_CORNER_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
