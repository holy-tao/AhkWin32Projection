#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
class SIGNER_CERT_CHOICE extends Win32Enum {

    /**
     * Native name: SIGNER_CERT_SPC_FILE
     * @type {Integer (UInt32)}
     */
    static SPC_FILE => 1

    /**
     * Native name: SIGNER_CERT_STORE
     * @type {Integer (UInt32)}
     */
    static STORE => 2

    /**
     * Native name: SIGNER_CERT_SPC_CHAIN
     * @type {Integer (UInt32)}
     */
    static SPC_CHAIN => 3
}
