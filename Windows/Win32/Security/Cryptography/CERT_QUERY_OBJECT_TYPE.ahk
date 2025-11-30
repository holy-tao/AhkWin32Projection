#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_QUERY_OBJECT_TYPE extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_QUERY_OBJECT_FILE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_QUERY_OBJECT_BLOB => 2
}
