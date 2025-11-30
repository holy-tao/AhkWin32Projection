#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class OCSPRequestFlag extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static OCSP_RF_REJECT_SIGNED_REQUESTS => 1
}
