#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class X509HardwareKeyUsageFlags{

    /**
     * @type {Integer (Int32)}
     */
    static XCN_NCRYPT_PCP_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static XCN_NCRYPT_TPM12_PROVIDER => 65536

    /**
     * @type {Integer (Int32)}
     */
    static XCN_NCRYPT_PCP_SIGNATURE_KEY => 1

    /**
     * @type {Integer (Int32)}
     */
    static XCN_NCRYPT_PCP_ENCRYPTION_KEY => 2

    /**
     * @type {Integer (Int32)}
     */
    static XCN_NCRYPT_PCP_GENERIC_KEY => 3

    /**
     * @type {Integer (Int32)}
     */
    static XCN_NCRYPT_PCP_STORAGE_KEY => 4

    /**
     * @type {Integer (Int32)}
     */
    static XCN_NCRYPT_PCP_IDENTITY_KEY => 8
}
