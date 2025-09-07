#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class NCRYPT_OPERATION{

    /**
     * @type {Integer (UInt32)}
     */
    static NCRYPT_CIPHER_OPERATION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NCRYPT_HASH_OPERATION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NCRYPT_ASYMMETRIC_ENCRYPTION_OPERATION => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NCRYPT_SECRET_AGREEMENT_OPERATION => 8

    /**
     * @type {Integer (UInt32)}
     */
    static NCRYPT_SIGNATURE_OPERATION => 16
}
