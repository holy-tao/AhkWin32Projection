#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleClipRule extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static styleClipRuleNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleClipRuleNonZero => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleClipRuleEvenOdd => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleClipRule_Max => 2147483647
}
