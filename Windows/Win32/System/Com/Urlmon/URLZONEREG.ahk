#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class URLZONEREG extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static URLZONEREG_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static URLZONEREG_HKLM => 1

    /**
     * @type {Integer (Int32)}
     */
    static URLZONEREG_HKCU => 2
}
