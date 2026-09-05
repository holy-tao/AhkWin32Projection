#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
class CERT_BIOMETRIC_DATA_TYPE extends Win32Enum {

    /**
     * Native name: CERT_BIOMETRIC_PREDEFINED_DATA_CHOICE
     * @type {Integer (UInt32)}
     */
    static PREDEFINED_DATA_CHOICE => 1

    /**
     * Native name: CERT_BIOMETRIC_OID_DATA_CHOICE
     * @type {Integer (UInt32)}
     */
    static OID_DATA_CHOICE => 2
}
