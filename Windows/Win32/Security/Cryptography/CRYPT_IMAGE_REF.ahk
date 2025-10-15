#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Contains information about a CNG provider module.
 * @see https://docs.microsoft.com/windows/win32/api//bcrypt/ns-bcrypt-crypt_image_ref
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_IMAGE_REF extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A pointer to a null-terminated Unicode string that contains the name of the provider module.
     * @type {PWSTR}
     */
    pszImage{
        get {
            if(!this.HasProp("__pszImage"))
                this.__pszImage := PWSTR(this.ptr + 0)
            return this.__pszImage
        }
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
