#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class svgLengthType extends Win32Enum {

    /**
     * Native name: SVG_LENGTHTYPE_UNKNOWN
     * @type {Integer (Int32)}
     */
    static LENGTHTYPE_UNKNOWN => 0

    /**
     * Native name: SVG_LENGTHTYPE_NUMBER
     * @type {Integer (Int32)}
     */
    static LENGTHTYPE_NUMBER => 1

    /**
     * Native name: SVG_LENGTHTYPE_PERCENTAGE
     * @type {Integer (Int32)}
     */
    static LENGTHTYPE_PERCENTAGE => 2

    /**
     * Native name: SVG_LENGTHTYPE_EMS
     * @type {Integer (Int32)}
     */
    static LENGTHTYPE_EMS => 3

    /**
     * Native name: SVG_LENGTHTYPE_EXS
     * @type {Integer (Int32)}
     */
    static LENGTHTYPE_EXS => 4

    /**
     * Native name: SVG_LENGTHTYPE_PX
     * @type {Integer (Int32)}
     */
    static LENGTHTYPE_PX => 5

    /**
     * Native name: SVG_LENGTHTYPE_CM
     * @type {Integer (Int32)}
     */
    static LENGTHTYPE_CM => 6

    /**
     * Native name: SVG_LENGTHTYPE_MM
     * @type {Integer (Int32)}
     */
    static LENGTHTYPE_MM => 7

    /**
     * Native name: SVG_LENGTHTYPE_IN
     * @type {Integer (Int32)}
     */
    static LENGTHTYPE_IN => 8

    /**
     * Native name: SVG_LENGTHTYPE_PT
     * @type {Integer (Int32)}
     */
    static LENGTHTYPE_PT => 9

    /**
     * Native name: SVG_LENGTHTYPE_PC
     * @type {Integer (Int32)}
     */
    static LENGTHTYPE_PC => 10

    /**
     * Native name: svgLengthType_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
