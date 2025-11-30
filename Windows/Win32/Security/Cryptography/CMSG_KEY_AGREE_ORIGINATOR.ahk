#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CMSG_KEY_AGREE_ORIGINATOR extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static CMSG_KEY_AGREE_ORIGINATOR_CERT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CMSG_KEY_AGREE_ORIGINATOR_PUBLIC_KEY => 2
}
