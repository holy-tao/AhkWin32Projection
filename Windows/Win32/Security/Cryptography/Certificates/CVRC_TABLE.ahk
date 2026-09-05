#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
class CVRC_TABLE extends Win32Enum {

    /**
     * Native name: CVRC_TABLE_ATTRIBUTES
     * @type {Integer (Int32)}
     */
    static ATTRIBUTES => 16384

    /**
     * Native name: CVRC_TABLE_CRL
     * @type {Integer (Int32)}
     */
    static CRL => 20480

    /**
     * Native name: CVRC_TABLE_EXTENSIONS
     * @type {Integer (Int32)}
     */
    static EXTENSIONS => 12288

    /**
     * Native name: CVRC_TABLE_REQCERT
     * @type {Integer (Int32)}
     */
    static REQCERT => 0
}
