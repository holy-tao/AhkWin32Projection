#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleFillRule extends Win32Enum {

    /**
     * Native name: styleFillRuleNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 0

    /**
     * Native name: styleFillRuleNonZero
     * @type {Integer (Int32)}
     */
    static NonZero => 1

    /**
     * Native name: styleFillRuleEvenOdd
     * @type {Integer (Int32)}
     */
    static EvenOdd => 2

    /**
     * Native name: styleFillRule_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
