#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains a key BLOB.
 * @see https://learn.microsoft.com/windows/win32/api/ncrypt/ns-ncrypt-ncrypt_key_blob_header
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct NCRYPT_KEY_BLOB_HEADER {
    #StructPack 4

    /**
     * The size, in bytes, of this structure.
     */
    cbSize : UInt32 := this.Size

    dwMagic : UInt32

    /**
     * Size, in bytes, of the null-terminated algorithm name, including the terminating zero.
     */
    cbAlgName : UInt32

    /**
     * Size, in bytes, of the <b>BLOB</b>.
     */
    cbKeyData : UInt32

}
