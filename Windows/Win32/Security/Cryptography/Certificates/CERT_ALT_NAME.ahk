#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
class CERT_ALT_NAME extends Win32Enum {

    /**
     * Native name: CERT_ALT_NAME_RFC822_NAME
     * @type {Integer (Int32)}
     */
    static RFC822_NAME => 2

    /**
     * Native name: CERT_ALT_NAME_DNS_NAME
     * @type {Integer (Int32)}
     */
    static DNS_NAME => 3

    /**
     * Native name: CERT_ALT_NAME_URL
     * @type {Integer (Int32)}
     */
    static URL => 7

    /**
     * Native name: CERT_ALT_NAME_REGISTERED_ID
     * @type {Integer (Int32)}
     */
    static REGISTERED_ID => 9

    /**
     * Native name: CERT_ALT_NAME_DIRECTORY_NAME
     * @type {Integer (Int32)}
     */
    static DIRECTORY_NAME => 5

    /**
     * Native name: CERT_ALT_NAME_IP_ADDRESS
     * @type {Integer (Int32)}
     */
    static IP_ADDRESS => 8

    /**
     * Native name: CERT_ALT_NAME_OTHER_NAME
     * @type {Integer (Int32)}
     */
    static OTHER_NAME => 1
}
