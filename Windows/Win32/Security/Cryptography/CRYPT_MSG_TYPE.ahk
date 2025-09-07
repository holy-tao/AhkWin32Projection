#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_MSG_TYPE{

    /**
     * @type {Integer (UInt32)}
     */
    static CMSG_DATA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CMSG_SIGNED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CMSG_ENVELOPED => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CMSG_SIGNED_AND_ENVELOPED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CMSG_HASHED => 5
}
