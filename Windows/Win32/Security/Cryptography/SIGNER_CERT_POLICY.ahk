#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
class SIGNER_CERT_POLICY extends Win32BitflagEnum {

    /**
     * Native name: SIGNER_CERT_POLICY_STORE
     * @type {Integer (UInt32)}
     */
    static STORE => 1

    /**
     * Native name: SIGNER_CERT_POLICY_CHAIN
     * @type {Integer (UInt32)}
     */
    static CHAIN => 2

    /**
     * Native name: SIGNER_CERT_POLICY_SPC
     * @type {Integer (UInt32)}
     */
    static SPC => 4

    /**
     * Native name: SIGNER_CERT_POLICY_CHAIN_NO_ROOT
     * @type {Integer (UInt32)}
     */
    static CHAIN_NO_ROOT => 8
}
