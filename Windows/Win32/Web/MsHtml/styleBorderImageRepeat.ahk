#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleBorderImageRepeat extends Win32Enum {

    /**
     * Native name: styleBorderImageRepeatStretch
     * @type {Integer (Int32)}
     */
    static Stretch => 0

    /**
     * Native name: styleBorderImageRepeatRepeat
     * @type {Integer (Int32)}
     */
    static Repeat => 1

    /**
     * Native name: styleBorderImageRepeatRound
     * @type {Integer (Int32)}
     */
    static Round => 2

    /**
     * Native name: styleBorderImageRepeatSpace
     * @type {Integer (Int32)}
     */
    static Space => 3

    /**
     * Native name: styleBorderImageRepeatNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 4

    /**
     * Native name: styleBorderImageRepeat_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
