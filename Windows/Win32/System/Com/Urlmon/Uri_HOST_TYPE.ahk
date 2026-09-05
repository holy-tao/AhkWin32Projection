#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
class Uri_HOST_TYPE extends Win32Enum {

    /**
     * Native name: Uri_HOST_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 0

    /**
     * Native name: Uri_HOST_DNS
     * @type {Integer (Int32)}
     */
    static DNS => 1

    /**
     * Native name: Uri_HOST_IPV4
     * @type {Integer (Int32)}
     */
    static IPV4 => 2

    /**
     * Native name: Uri_HOST_IPV6
     * @type {Integer (Int32)}
     */
    static IPV6 => 3

    /**
     * Native name: Uri_HOST_IDN
     * @type {Integer (Int32)}
     */
    static IDN => 4
}
