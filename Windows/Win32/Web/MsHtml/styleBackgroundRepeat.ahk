#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleBackgroundRepeat extends Win32Enum {

    /**
     * Native name: styleBackgroundRepeatRepeat
     * @type {Integer (Int32)}
     */
    static Repeat => 0

    /**
     * Native name: styleBackgroundRepeatRepeatX
     * @type {Integer (Int32)}
     */
    static RepeatX => 1

    /**
     * Native name: styleBackgroundRepeatRepeatY
     * @type {Integer (Int32)}
     */
    static RepeatY => 2

    /**
     * Native name: styleBackgroundRepeatNoRepeat
     * @type {Integer (Int32)}
     */
    static NoRepeat => 3

    /**
     * Native name: styleBackgroundRepeatNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 4

    /**
     * Native name: styleBackgroundRepeat_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
