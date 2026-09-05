#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security
 */
class LOGON32_PROVIDER extends Win32Enum {

    /**
     * Native name: LOGON32_PROVIDER_DEFAULT
     * @type {Integer (UInt32)}
     */
    static DEFAULT => 0

    /**
     * Native name: LOGON32_PROVIDER_WINNT50
     * @type {Integer (UInt32)}
     */
    static WINNT50 => 3

    /**
     * Native name: LOGON32_PROVIDER_WINNT40
     * @type {Integer (UInt32)}
     */
    static WINNT40 => 2
}
