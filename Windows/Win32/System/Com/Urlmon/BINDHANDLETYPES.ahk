#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class BINDHANDLETYPES extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static BINDHANDLETYPES_APPCACHE => 0

    /**
     * @type {Integer (Int32)}
     */
    static BINDHANDLETYPES_DEPENDENCY => 1

    /**
     * @type {Integer (Int32)}
     */
    static BINDHANDLETYPES_COUNT => 2
}
