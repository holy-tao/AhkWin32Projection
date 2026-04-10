#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
class CERT_CREATE_REQUEST_FLAGS extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static XECR_CMC => 3

    /**
     * @type {Integer (Int32)}
     */
    static XECR_PKCS10_V1_5 => 4

    /**
     * @type {Integer (Int32)}
     */
    static XECR_PKCS10_V2_0 => 1

    /**
     * @type {Integer (Int32)}
     */
    static XECR_PKCS7 => 2
}
