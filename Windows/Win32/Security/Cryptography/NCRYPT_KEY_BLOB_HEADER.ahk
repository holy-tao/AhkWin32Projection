#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains a key BLOB.
 * @see https://learn.microsoft.com/windows/win32/api/ncrypt/ns-ncrypt-ncrypt_key_blob_header
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class NCRYPT_KEY_BLOB_HEADER extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * The size, in bytes, of this structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    dwMagic {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Size, in bytes, of the null-terminated algorithm name, including the terminating zero.
     * @type {Integer}
     */
    cbAlgName {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Size, in bytes, of the <b>BLOB</b>.
     * @type {Integer}
     */
    cbKeyData {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 16
    }
}
