#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
class CERT_STORE_SAVE_AS extends Win32Enum {

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_STORE_SAVE_AS_PKCS7 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_STORE_SAVE_AS_STORE => 1
}
