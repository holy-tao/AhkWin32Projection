#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class BCRYPT_DH_KEY_BLOB_MAGIC extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static BCRYPT_DH_PUBLIC_MAGIC => 1112557636

    /**
     * @type {Integer (UInt32)}
     */
    static BCRYPT_DH_PRIVATE_MAGIC => 1448101956
}
