#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class HTMLAppFlag extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static HTMLAppFlagNo => 0

    /**
     * @type {Integer (Int32)}
     */
    static HTMLAppFlagOff => 0

    /**
     * @type {Integer (Int32)}
     */
    static HTMLAppFlag0 => 0

    /**
     * @type {Integer (Int32)}
     */
    static HTMLAppFlagYes => 1

    /**
     * @type {Integer (Int32)}
     */
    static HTMLAppFlagOn => 1

    /**
     * @type {Integer (Int32)}
     */
    static HTMLAppFlag1 => 1

    /**
     * @type {Integer (Int32)}
     */
    static HTMLAppFlag_Max => 2147483647
}
