#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class svgFecompositeOperator extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SVG_FECOMPOSITE_OPERATOR_UNKNOWN => 0

    /**
     * @type {Integer (Int32)}
     */
    static SVG_FECOMPOSITE_OPERATOR_OVER => 1

    /**
     * @type {Integer (Int32)}
     */
    static SVG_FECOMPOSITE_OPERATOR_IN => 2

    /**
     * @type {Integer (Int32)}
     */
    static SVG_FECOMPOSITE_OPERATOR_OUT => 3

    /**
     * @type {Integer (Int32)}
     */
    static SVG_FECOMPOSITE_OPERATOR_ATOP => 4

    /**
     * @type {Integer (Int32)}
     */
    static SVG_FECOMPOSITE_OPERATOR_XOR => 5

    /**
     * @type {Integer (Int32)}
     */
    static SVG_FECOMPOSITE_OPERATOR_ARITHMETIC => 6

    /**
     * @type {Integer (Int32)}
     */
    static svgFecompositeOperator_Max => 2147483647
}
