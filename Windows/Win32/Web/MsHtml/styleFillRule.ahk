#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class styleFillRule extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static styleFillRuleNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleFillRuleNonZero => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleFillRuleEvenOdd => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleFillRule_Max => 2147483647
}
