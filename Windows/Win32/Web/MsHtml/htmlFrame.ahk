#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class htmlFrame extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static htmlFrameNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static htmlFramevoid => 1

    /**
     * @type {Integer (Int32)}
     */
    static htmlFrameabove => 2

    /**
     * @type {Integer (Int32)}
     */
    static htmlFramebelow => 3

    /**
     * @type {Integer (Int32)}
     */
    static htmlFramehsides => 4

    /**
     * @type {Integer (Int32)}
     */
    static htmlFramelhs => 5

    /**
     * @type {Integer (Int32)}
     */
    static htmlFramerhs => 6

    /**
     * @type {Integer (Int32)}
     */
    static htmlFramevsides => 7

    /**
     * @type {Integer (Int32)}
     */
    static htmlFramebox => 8

    /**
     * @type {Integer (Int32)}
     */
    static htmlFrameborder => 9

    /**
     * @type {Integer (Int32)}
     */
    static htmlFrame_Max => 2147483647
}
