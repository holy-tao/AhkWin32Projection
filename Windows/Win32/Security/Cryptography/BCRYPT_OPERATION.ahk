#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
class BCRYPT_OPERATION extends Win32BitflagEnum {

    /**
     * Native name: BCRYPT_CIPHER_OPERATION
     * @type {Integer (UInt32)}
     */
    static CIPHER_OPERATION => 1

    /**
     * Native name: BCRYPT_HASH_OPERATION
     * @type {Integer (UInt32)}
     */
    static HASH_OPERATION => 2

    /**
     * Native name: BCRYPT_ASYMMETRIC_ENCRYPTION_OPERATION
     * @type {Integer (UInt32)}
     */
    static ASYMMETRIC_ENCRYPTION_OPERATION => 4

    /**
     * Native name: BCRYPT_SECRET_AGREEMENT_OPERATION
     * @type {Integer (UInt32)}
     */
    static SECRET_AGREEMENT_OPERATION => 8

    /**
     * Native name: BCRYPT_SIGNATURE_OPERATION
     * @type {Integer (UInt32)}
     */
    static SIGNATURE_OPERATION => 16

    /**
     * Native name: BCRYPT_RNG_OPERATION
     * @type {Integer (UInt32)}
     */
    static RNG_OPERATION => 32
}
