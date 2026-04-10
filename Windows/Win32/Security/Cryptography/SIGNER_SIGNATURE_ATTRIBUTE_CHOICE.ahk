#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
class SIGNER_SIGNATURE_ATTRIBUTE_CHOICE extends Win32Enum {

    /**
     * @type {Integer (UInt32)}
     */
    static SIGNER_NO_ATTR => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SIGNER_AUTHCODE_ATTR => 1
}
