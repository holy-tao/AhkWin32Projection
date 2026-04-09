#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleBreakInside extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static styleBreakInsideNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleBreakInsideAuto => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleBreakInsideAvoid => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleBreakInsideAvoidPage => 3

    /**
     * @type {Integer (Int32)}
     */
    static styleBreakInsideAvoidColumn => 4

    /**
     * @type {Integer (Int32)}
     */
    static styleBreakInside_Max => 2147483647
}
