#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Credentials
 * @version v4.0.30319
 */
class SCARD_SCOPE extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_SCOPE_USER => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_SCOPE_SYSTEM => 2
}
