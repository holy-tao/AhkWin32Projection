#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
class CRYPT_MSG_TYPE extends Win32Enum {

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
