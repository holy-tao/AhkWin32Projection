#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class styleBorderImageRepeat extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static styleBorderImageRepeatStretch => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleBorderImageRepeatRepeat => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleBorderImageRepeatRound => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleBorderImageRepeatSpace => 3

    /**
     * @type {Integer (Int32)}
     */
    static styleBorderImageRepeatNotSet => 4

    /**
     * @type {Integer (Int32)}
     */
    static styleBorderImageRepeat_Max => 2147483647
}
