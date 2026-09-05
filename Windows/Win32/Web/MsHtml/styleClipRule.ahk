#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleClipRule extends Win32Enum {

    /**
     * Native name: styleClipRuleNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 0

    /**
     * Native name: styleClipRuleNonZero
     * @type {Integer (Int32)}
     */
    static NonZero => 1

    /**
     * Native name: styleClipRuleEvenOdd
     * @type {Integer (Int32)}
     */
    static EvenOdd => 2

    /**
     * Native name: styleClipRule_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
