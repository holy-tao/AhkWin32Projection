#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_CREATE_SELFSIGN_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_CREATE_SELFSIGN_NO_KEY_INFO => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_CREATE_SELFSIGN_NO_SIGN => 1
}
