#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
class SIGNER_SIGNATURE_ATTRIBUTE_CHOICE extends Win32Enum {

    /**
     * Native name: SIGNER_NO_ATTR
     * @type {Integer (UInt32)}
     */
    static NO_ATTR => 0

    /**
     * Native name: SIGNER_AUTHCODE_ATTR
     * @type {Integer (UInt32)}
     */
    static AUTHCODE_ATTR => 1
}
