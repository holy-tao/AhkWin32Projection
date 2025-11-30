#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security
 * @version v4.0.30319
 */
class LOGON32_PROVIDER extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static LOGON32_PROVIDER_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static LOGON32_PROVIDER_WINNT50 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static LOGON32_PROVIDER_WINNT40 => 2
}
