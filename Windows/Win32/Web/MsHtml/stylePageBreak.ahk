#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class stylePageBreak extends Win32Enum {

    /**
     * Native name: stylePageBreakNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 0

    /**
     * Native name: stylePageBreakAuto
     * @type {Integer (Int32)}
     */
    static Auto => 1

    /**
     * Native name: stylePageBreakAlways
     * @type {Integer (Int32)}
     */
    static Always => 2

    /**
     * Native name: stylePageBreakLeft
     * @type {Integer (Int32)}
     */
    static Left => 3

    /**
     * Native name: stylePageBreakRight
     * @type {Integer (Int32)}
     */
    static Right => 4

    /**
     * Native name: stylePageBreakAvoid
     * @type {Integer (Int32)}
     */
    static Avoid => 5

    /**
     * Native name: stylePageBreak_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
