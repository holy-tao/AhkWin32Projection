#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class stylePageBreakInside extends Win32Enum {

    /**
     * Native name: stylePageBreakInsideNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 0

    /**
     * Native name: stylePageBreakInsideAuto
     * @type {Integer (Int32)}
     */
    static Auto => 1

    /**
     * Native name: stylePageBreakInsideAvoid
     * @type {Integer (Int32)}
     */
    static Avoid => 2

    /**
     * Native name: stylePageBreakInside_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
