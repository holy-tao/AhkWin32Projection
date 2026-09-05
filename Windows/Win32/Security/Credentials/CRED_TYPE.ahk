#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Credentials
 */
class CRED_TYPE extends Win32Enum {

    /**
     * Native name: CRED_TYPE_GENERIC
     * @type {Integer (UInt32)}
     */
    static GENERIC => 1

    /**
     * Native name: CRED_TYPE_DOMAIN_PASSWORD
     * @type {Integer (UInt32)}
     */
    static DOMAIN_PASSWORD => 2

    /**
     * Native name: CRED_TYPE_DOMAIN_CERTIFICATE
     * @type {Integer (UInt32)}
     */
    static DOMAIN_CERTIFICATE => 3

    /**
     * Native name: CRED_TYPE_DOMAIN_VISIBLE_PASSWORD
     * @type {Integer (UInt32)}
     */
    static DOMAIN_VISIBLE_PASSWORD => 4

    /**
     * Native name: CRED_TYPE_GENERIC_CERTIFICATE
     * @type {Integer (UInt32)}
     */
    static GENERIC_CERTIFICATE => 5

    /**
     * Native name: CRED_TYPE_DOMAIN_EXTENDED
     * @type {Integer (UInt32)}
     */
    static DOMAIN_EXTENDED => 6

    /**
     * Native name: CRED_TYPE_MAXIMUM
     * @type {Integer (UInt32)}
     */
    static MAXIMUM => 7

    /**
     * Native name: CRED_TYPE_MAXIMUM_EX
     * @type {Integer (UInt32)}
     */
    static MAXIMUM_EX => 1007
}
