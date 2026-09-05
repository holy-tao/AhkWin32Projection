#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Credentials
 */
class SCARD_SCOPE extends Win32Enum {

    /**
     * Native name: SCARD_SCOPE_USER
     * @type {Integer (UInt32)}
     */
    static USER => 0

    /**
     * Native name: SCARD_SCOPE_SYSTEM
     * @type {Integer (UInt32)}
     */
    static SYSTEM => 2
}
