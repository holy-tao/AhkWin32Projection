#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
class CERT_STRING_TYPE extends Win32Enum {

    /**
     * Native name: CERT_SIMPLE_NAME_STR
     * @type {Integer (UInt32)}
     */
    static SIMPLE_NAME_STR => 1

    /**
     * Native name: CERT_OID_NAME_STR
     * @type {Integer (UInt32)}
     */
    static OID_NAME_STR => 2

    /**
     * Native name: CERT_X500_NAME_STR
     * @type {Integer (UInt32)}
     */
    static X500_NAME_STR => 3
}
