#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about the registered CNG providers.
 * @see https://docs.microsoft.com/windows/win32/api//bcrypt/ns-bcrypt-crypt_providers
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_PROVIDERS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Contains the number of elements in the <b>rgpszProviders</b> array.
     * @type {Integer}
     */
    cProviders {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * An array of null-terminated Unicode strings that contains the names of the registered providers.
     * @type {Pointer<Char>}
     */
    rgpszProviders {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
