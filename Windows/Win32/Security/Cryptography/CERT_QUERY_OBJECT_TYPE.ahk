#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
class CERT_QUERY_OBJECT_TYPE extends Win32Enum {

    /**
     * Native name: CERT_QUERY_OBJECT_FILE
     * @type {Integer (UInt32)}
     */
    static FILE => 1

    /**
     * Native name: CERT_QUERY_OBJECT_BLOB
     * @type {Integer (UInt32)}
     */
    static BLOB => 2
}
