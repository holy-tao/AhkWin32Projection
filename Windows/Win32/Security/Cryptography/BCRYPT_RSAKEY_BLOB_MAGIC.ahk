#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
class BCRYPT_RSAKEY_BLOB_MAGIC extends Win32Enum {

    /**
     * Native name: BCRYPT_RSAPUBLIC_MAGIC
     * @type {Integer (UInt32)}
     */
    static RSAPUBLIC_MAGIC => 826364754

    /**
     * Native name: BCRYPT_RSAPRIVATE_MAGIC
     * @type {Integer (UInt32)}
     */
    static RSAPRIVATE_MAGIC => 843141970

    /**
     * Native name: BCRYPT_RSAFULLPRIVATE_MAGIC
     * @type {Integer (UInt32)}
     */
    static RSAFULLPRIVATE_MAGIC => 859919186
}
