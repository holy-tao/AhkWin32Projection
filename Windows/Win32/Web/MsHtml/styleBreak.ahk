#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleBreak extends Win32Enum {

    /**
     * Native name: styleBreakNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 0

    /**
     * Native name: styleBreakAuto
     * @type {Integer (Int32)}
     */
    static Auto => 1

    /**
     * Native name: styleBreakAlways
     * @type {Integer (Int32)}
     */
    static Always => 2

    /**
     * Native name: styleBreakAvoid
     * @type {Integer (Int32)}
     */
    static Avoid => 3

    /**
     * Native name: styleBreakLeft
     * @type {Integer (Int32)}
     */
    static Left => 4

    /**
     * Native name: styleBreakRight
     * @type {Integer (Int32)}
     */
    static Right => 5

    /**
     * Native name: styleBreakPage
     * @type {Integer (Int32)}
     */
    static Page => 6

    /**
     * Native name: styleBreakColumn
     * @type {Integer (Int32)}
     */
    static Column => 7

    /**
     * Native name: styleBreakAvoidPage
     * @type {Integer (Int32)}
     */
    static AvoidPage => 8

    /**
     * Native name: styleBreakAvoidColumn
     * @type {Integer (Int32)}
     */
    static AvoidColumn => 9

    /**
     * Native name: styleBreak_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
