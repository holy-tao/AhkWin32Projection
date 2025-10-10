#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the name of a CNG provider.
 * @see https://docs.microsoft.com/windows/win32/api//bcrypt/ns-bcrypt-bcrypt_provider_name
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class BCRYPT_PROVIDER_NAME extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * A pointer to a null-terminated Unicode string that contains the name of the provider.
     * @type {Pointer<Char>}
     */
    pszProviderName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
