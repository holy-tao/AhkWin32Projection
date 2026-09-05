#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
class CMSG_KEY_AGREE_ORIGINATOR extends Win32Enum {

    /**
     * Native name: CMSG_KEY_AGREE_ORIGINATOR_CERT
     * @type {Integer (UInt32)}
     */
    static CERT => 1

    /**
     * Native name: CMSG_KEY_AGREE_ORIGINATOR_PUBLIC_KEY
     * @type {Integer (UInt32)}
     */
    static PUBLIC_KEY => 2
}
