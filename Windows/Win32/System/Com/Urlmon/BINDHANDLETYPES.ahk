#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
class BINDHANDLETYPES extends Win32Enum {

    /**
     * Native name: BINDHANDLETYPES_APPCACHE
     * @type {Integer (Int32)}
     */
    static APPCACHE => 0

    /**
     * Native name: BINDHANDLETYPES_DEPENDENCY
     * @type {Integer (Int32)}
     */
    static DEPENDENCY => 1

    /**
     * Native name: BINDHANDLETYPES_COUNT
     * @type {Integer (Int32)}
     */
    static COUNT => 2
}
