#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class URLZONE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static URLZONE_INVALID => -1

    /**
     * @type {Integer (Int32)}
     */
    static URLZONE_PREDEFINED_MIN => 0

    /**
     * @type {Integer (Int32)}
     */
    static URLZONE_LOCAL_MACHINE => 0

    /**
     * @type {Integer (Int32)}
     */
    static URLZONE_INTRANET => 1

    /**
     * @type {Integer (Int32)}
     */
    static URLZONE_TRUSTED => 2

    /**
     * @type {Integer (Int32)}
     */
    static URLZONE_INTERNET => 3

    /**
     * @type {Integer (Int32)}
     */
    static URLZONE_UNTRUSTED => 4

    /**
     * @type {Integer (Int32)}
     */
    static URLZONE_PREDEFINED_MAX => 999

    /**
     * @type {Integer (Int32)}
     */
    static URLZONE_USER_MIN => 1000

    /**
     * @type {Integer (Int32)}
     */
    static URLZONE_USER_MAX => 10000
}
