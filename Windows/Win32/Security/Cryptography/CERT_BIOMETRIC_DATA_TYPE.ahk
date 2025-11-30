#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_BIOMETRIC_DATA_TYPE extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_BIOMETRIC_PREDEFINED_DATA_CHOICE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_BIOMETRIC_OID_DATA_CHOICE => 2
}
