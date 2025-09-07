#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_FIND_TYPE{

    /**
     * @type {Integer (UInt32)}
     */
    static CTL_FIND_ANY => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CTL_FIND_SHA1_HASH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CTL_FIND_MD5_HASH => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CTL_FIND_USAGE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CTL_FIND_SAME_USAGE_FLAG => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CTL_FIND_EXISTING => 5

    /**
     * @type {Integer (UInt32)}
     */
    static CTL_FIND_SUBJECT => 4
}
