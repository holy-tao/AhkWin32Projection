#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
class BCRYPT_DH_KEY_BLOB_MAGIC extends Win32Enum {

    /**
     * Native name: BCRYPT_DH_PUBLIC_MAGIC
     * @type {Integer (UInt32)}
     */
    static PUBLIC_MAGIC => 1112557636

    /**
     * Native name: BCRYPT_DH_PRIVATE_MAGIC
     * @type {Integer (UInt32)}
     */
    static PRIVATE_MAGIC => 1448101956
}
