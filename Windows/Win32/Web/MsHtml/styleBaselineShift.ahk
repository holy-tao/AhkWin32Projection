#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleBaselineShift extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static styleBaselineShiftBaseline => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleBaselineShiftSub => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleBaselineShiftSuper => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleBaselineShift_Max => 2147483647
}
