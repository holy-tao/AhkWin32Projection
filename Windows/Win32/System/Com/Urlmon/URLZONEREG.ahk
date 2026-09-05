#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
class URLZONEREG extends Win32Enum {

    /**
     * Native name: URLZONEREG_DEFAULT
     * @type {Integer (Int32)}
     */
    static DEFAULT => 0

    /**
     * Native name: URLZONEREG_HKLM
     * @type {Integer (Int32)}
     */
    static HKLM => 1

    /**
     * Native name: URLZONEREG_HKCU
     * @type {Integer (Int32)}
     */
    static HKCU => 2
}
