#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class NCRYPT_ALGORITHM_NAME_CLASS extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static NCRYPT_ASYMMETRIC_ENCRYPTION_INTERFACE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static NCRYPT_SECRET_AGREEMENT_INTERFACE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NCRYPT_SIGNATURE_INTERFACE => 5
}
