#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class svgFecompositeOperator extends Win32Enum {

    /**
     * Native name: SVG_FECOMPOSITE_OPERATOR_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 0

    /**
     * Native name: SVG_FECOMPOSITE_OPERATOR_OVER
     * @type {Integer (Int32)}
     */
    static OVER => 1

    /**
     * Native name: SVG_FECOMPOSITE_OPERATOR_IN
     * @type {Integer (Int32)}
     */
    static IN => 2

    /**
     * Native name: SVG_FECOMPOSITE_OPERATOR_OUT
     * @type {Integer (Int32)}
     */
    static OUT => 3

    /**
     * Native name: SVG_FECOMPOSITE_OPERATOR_ATOP
     * @type {Integer (Int32)}
     */
    static ATOP => 4

    /**
     * Native name: SVG_FECOMPOSITE_OPERATOR_XOR
     * @type {Integer (Int32)}
     */
    static XOR => 5

    /**
     * Native name: SVG_FECOMPOSITE_OPERATOR_ARITHMETIC
     * @type {Integer (Int32)}
     */
    static ARITHMETIC => 6

    /**
     * Native name: svgFecompositeOperator_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
