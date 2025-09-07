#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class BCRYPT_INTERFACE{

    /**
     * @type {Integer (UInt32)}
     */
    static BCRYPT_ASYMMETRIC_ENCRYPTION_INTERFACE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static BCRYPT_CIPHER_INTERFACE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static BCRYPT_HASH_INTERFACE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static BCRYPT_RNG_INTERFACE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static BCRYPT_SECRET_AGREEMENT_INTERFACE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static BCRYPT_SIGNATURE_INTERFACE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static NCRYPT_KEY_STORAGE_INTERFACE => 65537

    /**
     * @type {Integer (UInt32)}
     */
    static NCRYPT_SCHANNEL_INTERFACE => 65538

    /**
     * @type {Integer (UInt32)}
     */
    static NCRYPT_SCHANNEL_SIGNATURE_INTERFACE => 65539
}
