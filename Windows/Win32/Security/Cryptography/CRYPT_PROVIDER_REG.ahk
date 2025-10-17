#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used to contain registration information for a CNG provider.
 * @see https://docs.microsoft.com/windows/win32/api//bcrypt/ns-bcrypt-crypt_provider_reg
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_PROVIDER_REG extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Contains the number of elements in the <b>rgpszAliases</b> array. If the provider has no aliases, this member will be zero and the <b>rgpszAliases</b> member will be <b>NULL</b>.
     * @type {Integer}
     */
    cAliases {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * An array of null-terminated Unicode strings that contains the aliases of the provider. If the provider has no aliases, this member will contain <b>NULL</b> and the <b>cAliases</b> member will contain zero.
     * @type {Pointer<PWSTR>}
     */
    rgpszAliases {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/bcrypt/ns-bcrypt-crypt_image_reg">CRYPT_IMAGE_REG</a> structure that contains the registration information for the user mode provider. If this member is <b>NULL</b>, the provider is not registered for user mode.
     * @type {Pointer<CRYPT_IMAGE_REG>}
     */
    pUM {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/bcrypt/ns-bcrypt-crypt_image_reg">CRYPT_IMAGE_REG</a> structure that contains the registration information for the kernel mode provider. If this member is <b>NULL</b>, the provider is not registered for kernel mode.
     * @type {Pointer<CRYPT_IMAGE_REG>}
     */
    pKM {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
