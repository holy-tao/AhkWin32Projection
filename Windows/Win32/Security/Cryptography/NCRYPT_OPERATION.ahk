#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
class NCRYPT_OPERATION extends Win32BitflagEnum {

    /**
     * Native name: NCRYPT_CIPHER_OPERATION
     * @type {Integer (UInt32)}
     */
    static CIPHER_OPERATION => 1

    /**
     * Native name: NCRYPT_HASH_OPERATION
     * @type {Integer (UInt32)}
     */
    static HASH_OPERATION => 2

    /**
     * Native name: NCRYPT_ASYMMETRIC_ENCRYPTION_OPERATION
     * @type {Integer (UInt32)}
     */
    static ASYMMETRIC_ENCRYPTION_OPERATION => 4

    /**
     * Native name: NCRYPT_SECRET_AGREEMENT_OPERATION
     * @type {Integer (UInt32)}
     */
    static SECRET_AGREEMENT_OPERATION => 8

    /**
     * Native name: NCRYPT_SIGNATURE_OPERATION
     * @type {Integer (UInt32)}
     */
    static SIGNATURE_OPERATION => 16
}
