#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains image registration information about a CNG provider.
 * @see https://learn.microsoft.com/windows/win32/api/bcrypt/ns-bcrypt-crypt_image_reg
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_IMAGE_REG extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * A pointer to a null-terminated Unicode string that contains only the file name of the provider module.
     * @type {Pointer<Char>}
     */
    pszImage {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Contains the number of elements in the <b>rgpInterfaces</b> array.
     * @type {Integer}
     */
    cInterfaces {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/bcrypt/ns-bcrypt-crypt_interface_reg">CRYPT_INTERFACE_REG</a> structure pointers that specify the types of cryptographic interfaces that are supported by the provider. For example, if the provider supports both a cipher interface (<b>BCRYPT_CIPHER_INTERFACE</b>) and a hash interface (<b>BCRYPT_HASH_INTERFACE</b>), this array would contain two <b>CRYPT_INTERFACE_REG</b> structure pointers, one for the cipher interface and one for the hash interface.
     * @type {Pointer<CRYPT_INTERFACE_REG>}
     */
    rgpInterfaces {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
