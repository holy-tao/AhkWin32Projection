#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class svgMorphologyOperator extends Win32Enum {

    /**
     * Native name: SVG_MORPHOLOGY_OPERATOR_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 0

    /**
     * Native name: SVG_MORPHOLOGY_OPERATOR_ERODE
     * @type {Integer (Int32)}
     */
    static ERODE => 1

    /**
     * Native name: SVG_MORPHOLOGY_OPERATOR_DILATE
     * @type {Integer (Int32)}
     */
    static DILATE => 2

    /**
     * Native name: svgMorphologyOperator_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
