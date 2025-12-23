#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class URLTEMPLATE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static URLTEMPLATE_CUSTOM => 0

    /**
     * @type {Integer (Int32)}
     */
    static URLTEMPLATE_PREDEFINED_MIN => 65536

    /**
     * @type {Integer (Int32)}
     */
    static URLTEMPLATE_LOW => 65536

    /**
     * @type {Integer (Int32)}
     */
    static URLTEMPLATE_MEDLOW => 66816

    /**
     * @type {Integer (Int32)}
     */
    static URLTEMPLATE_MEDIUM => 69632

    /**
     * @type {Integer (Int32)}
     */
    static URLTEMPLATE_MEDHIGH => 70912

    /**
     * @type {Integer (Int32)}
     */
    static URLTEMPLATE_HIGH => 73728

    /**
     * @type {Integer (Int32)}
     */
    static URLTEMPLATE_PREDEFINED_MAX => 131072
}
