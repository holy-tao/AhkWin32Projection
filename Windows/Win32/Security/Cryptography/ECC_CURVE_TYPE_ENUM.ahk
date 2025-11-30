#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class ECC_CURVE_TYPE_ENUM extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static BCRYPT_ECC_PRIME_SHORT_WEIERSTRASS_CURVE => 1

    /**
     * @type {Integer (Int32)}
     */
    static BCRYPT_ECC_PRIME_TWISTED_EDWARDS_CURVE => 2

    /**
     * @type {Integer (Int32)}
     */
    static BCRYPT_ECC_PRIME_MONTGOMERY_CURVE => 3
}
