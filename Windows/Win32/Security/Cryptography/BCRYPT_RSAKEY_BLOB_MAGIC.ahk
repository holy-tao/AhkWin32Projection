#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class BCRYPT_RSAKEY_BLOB_MAGIC extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static BCRYPT_RSAPUBLIC_MAGIC => 826364754

    /**
     * @type {Integer (UInt32)}
     */
    static BCRYPT_RSAPRIVATE_MAGIC => 843141970

    /**
     * @type {Integer (UInt32)}
     */
    static BCRYPT_RSAFULLPRIVATE_MAGIC => 859919186
}
