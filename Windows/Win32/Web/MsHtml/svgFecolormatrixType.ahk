#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class svgFecolormatrixType extends Win32Enum {

    /**
     * Native name: SVG_FECOLORMATRIX_TYPE_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 0

    /**
     * Native name: SVG_FECOLORMATRIX_TYPE_MATRIX
     * @type {Integer (Int32)}
     */
    static MATRIX => 1

    /**
     * Native name: SVG_FECOLORMATRIX_TYPE_SATURATE
     * @type {Integer (Int32)}
     */
    static SATURATE => 2

    /**
     * Native name: SVG_FECOLORMATRIX_TYPE_HUEROTATE
     * @type {Integer (Int32)}
     */
    static HUEROTATE => 3

    /**
     * Native name: SVG_FECOLORMATRIX_TYPE_LUMINANCETOALPHA
     * @type {Integer (Int32)}
     */
    static LUMINANCETOALPHA => 4

    /**
     * Native name: svgFecolormatrixType_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
