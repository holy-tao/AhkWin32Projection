#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
class CERT_CREATE_SELFSIGN_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: CERT_CREATE_SELFSIGN_NO_KEY_INFO
     * @type {Integer (UInt32)}
     */
    static NO_KEY_INFO => 2

    /**
     * Native name: CERT_CREATE_SELFSIGN_NO_SIGN
     * @type {Integer (UInt32)}
     */
    static NO_SIGN => 1
}
