#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
class URLZONE extends Win32Enum {

    /**
     * Native name: URLZONE_INVALID
     * @type {Integer (Int32)}
     */
    static INVALID => -1

    /**
     * Native name: URLZONE_PREDEFINED_MIN
     * @type {Integer (Int32)}
     */
    static PREDEFINED_MIN => 0

    /**
     * Native name: URLZONE_LOCAL_MACHINE
     * @type {Integer (Int32)}
     */
    static LOCAL_MACHINE => 0

    /**
     * Native name: URLZONE_INTRANET
     * @type {Integer (Int32)}
     */
    static INTRANET => 1

    /**
     * Native name: URLZONE_TRUSTED
     * @type {Integer (Int32)}
     */
    static TRUSTED => 2

    /**
     * Native name: URLZONE_INTERNET
     * @type {Integer (Int32)}
     */
    static INTERNET => 3

    /**
     * Native name: URLZONE_UNTRUSTED
     * @type {Integer (Int32)}
     */
    static UNTRUSTED => 4

    /**
     * Native name: URLZONE_PREDEFINED_MAX
     * @type {Integer (Int32)}
     */
    static PREDEFINED_MAX => 999

    /**
     * Native name: URLZONE_USER_MIN
     * @type {Integer (Int32)}
     */
    static USER_MIN => 1000

    /**
     * Native name: URLZONE_USER_MAX
     * @type {Integer (Int32)}
     */
    static USER_MAX => 10000
}
