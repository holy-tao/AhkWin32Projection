#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Security.Credentials
 * @version v4.0.30319
 */
class CRED_TYPE{

    /**
     * @type {Integer (UInt32)}
     */
    static CRED_TYPE_GENERIC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CRED_TYPE_DOMAIN_PASSWORD => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CRED_TYPE_DOMAIN_CERTIFICATE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CRED_TYPE_DOMAIN_VISIBLE_PASSWORD => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CRED_TYPE_GENERIC_CERTIFICATE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static CRED_TYPE_DOMAIN_EXTENDED => 6

    /**
     * @type {Integer (UInt32)}
     */
    static CRED_TYPE_MAXIMUM => 7

    /**
     * @type {Integer (UInt32)}
     */
    static CRED_TYPE_MAXIMUM_EX => 1007
}
