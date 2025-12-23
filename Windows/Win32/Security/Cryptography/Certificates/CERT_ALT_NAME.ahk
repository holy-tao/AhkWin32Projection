#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class CERT_ALT_NAME extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static CERT_ALT_NAME_RFC822_NAME => 2

    /**
     * @type {Integer (Int32)}
     */
    static CERT_ALT_NAME_DNS_NAME => 3

    /**
     * @type {Integer (Int32)}
     */
    static CERT_ALT_NAME_URL => 7

    /**
     * @type {Integer (Int32)}
     */
    static CERT_ALT_NAME_REGISTERED_ID => 9

    /**
     * @type {Integer (Int32)}
     */
    static CERT_ALT_NAME_DIRECTORY_NAME => 5

    /**
     * @type {Integer (Int32)}
     */
    static CERT_ALT_NAME_IP_ADDRESS => 8

    /**
     * @type {Integer (Int32)}
     */
    static CERT_ALT_NAME_OTHER_NAME => 1
}
