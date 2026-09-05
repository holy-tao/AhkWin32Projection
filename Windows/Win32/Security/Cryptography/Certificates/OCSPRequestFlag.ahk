#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
class OCSPRequestFlag extends Win32Enum {

    /**
     * Native name: OCSP_RF_REJECT_SIGNED_REQUESTS
     * @type {Integer (Int32)}
     */
    static RF_REJECT_SIGNED_REQUESTS => 1
}
