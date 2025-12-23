#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_STRING_TYPE extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_SIMPLE_NAME_STR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_OID_NAME_STR => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_X500_NAME_STR => 3
}
