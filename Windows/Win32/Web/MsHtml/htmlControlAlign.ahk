#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class htmlControlAlign extends Win32Enum {

    /**
     * Native name: htmlControlAlignNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 0

    /**
     * Native name: htmlControlAlignLeft
     * @type {Integer (Int32)}
     */
    static Left => 1

    /**
     * Native name: htmlControlAlignCenter
     * @type {Integer (Int32)}
     */
    static Center => 2

    /**
     * Native name: htmlControlAlignRight
     * @type {Integer (Int32)}
     */
    static Right => 3

    /**
     * Native name: htmlControlAlignTextTop
     * @type {Integer (Int32)}
     */
    static TextTop => 4

    /**
     * Native name: htmlControlAlignAbsMiddle
     * @type {Integer (Int32)}
     */
    static AbsMiddle => 5

    /**
     * Native name: htmlControlAlignBaseline
     * @type {Integer (Int32)}
     */
    static Baseline => 6

    /**
     * Native name: htmlControlAlignAbsBottom
     * @type {Integer (Int32)}
     */
    static AbsBottom => 7

    /**
     * Native name: htmlControlAlignBottom
     * @type {Integer (Int32)}
     */
    static Bottom => 8

    /**
     * Native name: htmlControlAlignMiddle
     * @type {Integer (Int32)}
     */
    static Middle => 9

    /**
     * Native name: htmlControlAlignTop
     * @type {Integer (Int32)}
     */
    static Top => 10

    /**
     * Native name: htmlControlAlign_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
