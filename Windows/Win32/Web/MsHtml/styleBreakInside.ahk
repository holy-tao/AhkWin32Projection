#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleBreakInside extends Win32Enum {

    /**
     * Native name: styleBreakInsideNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 0

    /**
     * Native name: styleBreakInsideAuto
     * @type {Integer (Int32)}
     */
    static Auto => 1

    /**
     * Native name: styleBreakInsideAvoid
     * @type {Integer (Int32)}
     */
    static Avoid => 2

    /**
     * Native name: styleBreakInsideAvoidPage
     * @type {Integer (Int32)}
     */
    static AvoidPage => 3

    /**
     * Native name: styleBreakInsideAvoidColumn
     * @type {Integer (Int32)}
     */
    static AvoidColumn => 4

    /**
     * Native name: styleBreakInside_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
