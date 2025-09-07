#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class SIGNER_CERT_POLICY{

    /**
     * @type {Integer (UInt32)}
     */
    static SIGNER_CERT_POLICY_STORE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SIGNER_CERT_POLICY_CHAIN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SIGNER_CERT_POLICY_SPC => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SIGNER_CERT_POLICY_CHAIN_NO_ROOT => 8
}
