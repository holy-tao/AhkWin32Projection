#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleTextJustifyTrim extends Win32Enum {

    /**
     * Native name: styleTextJustifyTrimNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 0

    /**
     * Native name: styleTextJustifyTrimNone
     * @type {Integer (Int32)}
     */
    static None => 1

    /**
     * Native name: styleTextJustifyTrimPunctuation
     * @type {Integer (Int32)}
     */
    static Punctuation => 2

    /**
     * Native name: styleTextJustifyTrimPunctAndKana
     * @type {Integer (Int32)}
     */
    static PunctAndKana => 3

    /**
     * Native name: styleTextJustifyTrim_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
