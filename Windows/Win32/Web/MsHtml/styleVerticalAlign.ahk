#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleVerticalAlign extends Win32Enum {

    /**
     * Native name: styleVerticalAlignAuto
     * @type {Integer (Int32)}
     */
    static Auto => 0

    /**
     * Native name: styleVerticalAlignBaseline
     * @type {Integer (Int32)}
     */
    static Baseline => 1

    /**
     * Native name: styleVerticalAlignSub
     * @type {Integer (Int32)}
     */
    static Sub => 2

    /**
     * Native name: styleVerticalAlignSuper
     * @type {Integer (Int32)}
     */
    static Super => 3

    /**
     * Native name: styleVerticalAlignTop
     * @type {Integer (Int32)}
     */
    static Top => 4

    /**
     * Native name: styleVerticalAlignTextTop
     * @type {Integer (Int32)}
     */
    static TextTop => 5

    /**
     * Native name: styleVerticalAlignMiddle
     * @type {Integer (Int32)}
     */
    static Middle => 6

    /**
     * Native name: styleVerticalAlignBottom
     * @type {Integer (Int32)}
     */
    static Bottom => 7

    /**
     * Native name: styleVerticalAlignTextBottom
     * @type {Integer (Int32)}
     */
    static TextBottom => 8

    /**
     * Native name: styleVerticalAlignInherit
     * @type {Integer (Int32)}
     */
    static Inherit => 9

    /**
     * Native name: styleVerticalAlignNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 10

    /**
     * Native name: styleVerticalAlign_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
