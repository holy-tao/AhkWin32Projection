#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class Uri_HOST_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static Uri_HOST_UNKNOWN => 0

    /**
     * @type {Integer (Int32)}
     */
    static Uri_HOST_DNS => 1

    /**
     * @type {Integer (Int32)}
     */
    static Uri_HOST_IPV4 => 2

    /**
     * @type {Integer (Int32)}
     */
    static Uri_HOST_IPV6 => 3

    /**
     * @type {Integer (Int32)}
     */
    static Uri_HOST_IDN => 4
}
