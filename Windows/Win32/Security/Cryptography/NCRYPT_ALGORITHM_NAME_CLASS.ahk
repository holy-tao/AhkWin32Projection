#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
class NCRYPT_ALGORITHM_NAME_CLASS extends Win32Enum {

    /**
     * Native name: NCRYPT_ASYMMETRIC_ENCRYPTION_INTERFACE
     * @type {Integer (UInt32)}
     */
    static ASYMMETRIC_ENCRYPTION_INTERFACE => 3

    /**
     * Native name: NCRYPT_SECRET_AGREEMENT_INTERFACE
     * @type {Integer (UInt32)}
     */
    static SECRET_AGREEMENT_INTERFACE => 4

    /**
     * Native name: NCRYPT_SIGNATURE_INTERFACE
     * @type {Integer (UInt32)}
     */
    static SIGNATURE_INTERFACE => 5
}
