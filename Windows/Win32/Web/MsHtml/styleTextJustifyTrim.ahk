#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class styleTextJustifyTrim extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static styleTextJustifyTrimNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleTextJustifyTrimNone => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleTextJustifyTrimPunctuation => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleTextJustifyTrimPunctAndKana => 3

    /**
     * @type {Integer (Int32)}
     */
    static styleTextJustifyTrim_Max => 2147483647
}
