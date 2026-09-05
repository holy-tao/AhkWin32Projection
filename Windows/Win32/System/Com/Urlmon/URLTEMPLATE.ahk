#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
class URLTEMPLATE extends Win32Enum {

    /**
     * Native name: URLTEMPLATE_CUSTOM
     * @type {Integer (Int32)}
     */
    static CUSTOM => 0

    /**
     * Native name: URLTEMPLATE_PREDEFINED_MIN
     * @type {Integer (Int32)}
     */
    static PREDEFINED_MIN => 65536

    /**
     * Native name: URLTEMPLATE_LOW
     * @type {Integer (Int32)}
     */
    static LOW => 65536

    /**
     * Native name: URLTEMPLATE_MEDLOW
     * @type {Integer (Int32)}
     */
    static MEDLOW => 66816

    /**
     * Native name: URLTEMPLATE_MEDIUM
     * @type {Integer (Int32)}
     */
    static MEDIUM => 69632

    /**
     * Native name: URLTEMPLATE_MEDHIGH
     * @type {Integer (Int32)}
     */
    static MEDHIGH => 70912

    /**
     * Native name: URLTEMPLATE_HIGH
     * @type {Integer (Int32)}
     */
    static HIGH => 73728

    /**
     * Native name: URLTEMPLATE_PREDEFINED_MAX
     * @type {Integer (Int32)}
     */
    static PREDEFINED_MAX => 131072
}
