#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Is the base structure for all CNG key BLOBs.
 * @see https://learn.microsoft.com/windows/win32/api/bcrypt/ns-bcrypt-bcrypt_key_blob
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct BCRYPT_KEY_BLOB {
    #StructPack 4

    /**
     * Specifies the type of key this BLOB represents. The possible values for this member depend on the type of BLOB this structure represents.
     */
    Magic : UInt32

}
