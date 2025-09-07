#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains a collection of provider references.
 * @see https://learn.microsoft.com/windows/win32/api/bcrypt/ns-bcrypt-crypt_provider_refs
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_PROVIDER_REFS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The number of elements in the <b>rgpProviders</b> array.
     * @type {Integer}
     */
    cProviders {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/bcrypt/ns-bcrypt-crypt_provider_ref">CRYPT_PROVIDER_REF</a> structure pointers that contain the provider references. The <b>cProviders</b> member contains the number of elements in this array.
     * @type {Pointer<CRYPT_PROVIDER_REF>}
     */
    rgpProviders {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
