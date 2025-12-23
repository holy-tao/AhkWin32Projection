#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class styleBackgroundRepeat extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static styleBackgroundRepeatRepeat => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleBackgroundRepeatRepeatX => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleBackgroundRepeatRepeatY => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleBackgroundRepeatNoRepeat => 3

    /**
     * @type {Integer (Int32)}
     */
    static styleBackgroundRepeatNotSet => 4

    /**
     * @type {Integer (Int32)}
     */
    static styleBackgroundRepeat_Max => 2147483647
}
