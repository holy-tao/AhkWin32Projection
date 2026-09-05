#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class svgTransformType extends Win32Enum {

    /**
     * Native name: SVG_TRANSFORM_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 0

    /**
     * Native name: SVG_TRANSFORM_MATRIX
     * @type {Integer (Int32)}
     */
    static MATRIX => 1

    /**
     * Native name: SVG_TRANSFORM_TRANSLATE
     * @type {Integer (Int32)}
     */
    static TRANSLATE => 2

    /**
     * Native name: SVG_TRANSFORM_SCALE
     * @type {Integer (Int32)}
     */
    static SCALE => 3

    /**
     * Native name: SVG_TRANSFORM_ROTATE
     * @type {Integer (Int32)}
     */
    static ROTATE => 4

    /**
     * Native name: SVG_TRANSFORM_SKEWX
     * @type {Integer (Int32)}
     */
    static SKEWX => 5

    /**
     * Native name: SVG_TRANSFORM_SKEWY
     * @type {Integer (Int32)}
     */
    static SKEWY => 6

    /**
     * Native name: svgTransformType_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
