#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class BCRYPT_QUERY_PROVIDER_MODE extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_ANY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_UM => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_KM => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_MM => 3
}
