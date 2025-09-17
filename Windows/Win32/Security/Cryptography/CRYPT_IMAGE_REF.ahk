#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a CNG provider module.
 * @see https://learn.microsoft.com/windows/win32/api/bcrypt/ns-bcrypt-crypt_image_ref
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_IMAGE_REF extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A pointer to a null-terminated Unicode string that contains the name of the provider module.
     * @type {Pointer<Char>}
     */
    pszImage {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
