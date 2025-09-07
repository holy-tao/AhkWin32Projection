#Requires AutoHotkey v2.0.0 64-bit

/**
 * Contains FIPS version information.
 * @see https://learn.microsoft.com/windows/win32/api/bcrypt/ne-bcrypt-dsafipsversion_enum
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class DSAFIPSVERSION_ENUM{

    /**
     * Federal Information Processing Standard (FIPS) 2.
     * @type {Integer (Int32)}
     */
    static DSA_FIPS186_2 => 0

    /**
     * Federal Information Processing Standard (FIPS) 3.
     * @type {Integer (Int32)}
     */
    static DSA_FIPS186_3 => 1
}
