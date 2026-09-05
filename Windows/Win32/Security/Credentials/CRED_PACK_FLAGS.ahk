#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Credentials
 */
class CRED_PACK_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: CRED_PACK_PROTECTED_CREDENTIALS
     * @type {Integer (UInt32)}
     */
    static PROTECTED_CREDENTIALS => 1

    /**
     * Native name: CRED_PACK_WOW_BUFFER
     * @type {Integer (UInt32)}
     */
    static WOW_BUFFER => 2

    /**
     * Native name: CRED_PACK_GENERIC_CREDENTIALS
     * @type {Integer (UInt32)}
     */
    static GENERIC_CREDENTIALS => 4

    /**
     * Native name: CRED_PACK_ID_PROVIDER_CREDENTIALS
     * @type {Integer (UInt32)}
     */
    static ID_PROVIDER_CREDENTIALS => 8
}
