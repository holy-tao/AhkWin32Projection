#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleBaselineShift extends Win32Enum {

    /**
     * Native name: styleBaselineShiftBaseline
     * @type {Integer (Int32)}
     */
    static Baseline => 0

    /**
     * Native name: styleBaselineShiftSub
     * @type {Integer (Int32)}
     */
    static Sub => 1

    /**
     * Native name: styleBaselineShiftSuper
     * @type {Integer (Int32)}
     */
    static Super => 2

    /**
     * Native name: styleBaselineShift_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
