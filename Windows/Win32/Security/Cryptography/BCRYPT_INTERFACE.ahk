#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
class BCRYPT_INTERFACE extends Win32Enum {

    /**
     * Native name: BCRYPT_ASYMMETRIC_ENCRYPTION_INTERFACE
     * @type {Integer (UInt32)}
     */
    static ASYMMETRIC_ENCRYPTION_INTERFACE => 3

    /**
     * Native name: BCRYPT_CIPHER_INTERFACE
     * @type {Integer (UInt32)}
     */
    static CIPHER_INTERFACE => 1

    /**
     * Native name: BCRYPT_HASH_INTERFACE
     * @type {Integer (UInt32)}
     */
    static HASH_INTERFACE => 2

    /**
     * Native name: BCRYPT_RNG_INTERFACE
     * @type {Integer (UInt32)}
     */
    static RNG_INTERFACE => 6

    /**
     * Native name: BCRYPT_SECRET_AGREEMENT_INTERFACE
     * @type {Integer (UInt32)}
     */
    static SECRET_AGREEMENT_INTERFACE => 4

    /**
     * Native name: BCRYPT_SIGNATURE_INTERFACE
     * @type {Integer (UInt32)}
     */
    static SIGNATURE_INTERFACE => 5

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
