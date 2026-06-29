#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\CRYPT_INTERFACE_REG.ahk" { CRYPT_INTERFACE_REG }

/**
 * Contains image registration information about a CNG provider.
 * @see https://learn.microsoft.com/windows/win32/api/bcrypt/ns-bcrypt-crypt_image_reg
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_IMAGE_REG {
    #StructPack 8

    /**
     * A pointer to a null-terminated Unicode string that contains only the file name of the provider module.
     */
    pszImage : PWSTR

    /**
     * Contains the number of elements in the <b>rgpInterfaces</b> array.
     */
    cInterfaces : UInt32

    /**
     * A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/bcrypt/ns-bcrypt-crypt_interface_reg">CRYPT_INTERFACE_REG</a> structure pointers that specify the types of cryptographic interfaces that are supported by the provider. For example, if the provider supports both a cipher interface (<b>BCRYPT_CIPHER_INTERFACE</b>) and a hash interface (<b>BCRYPT_HASH_INTERFACE</b>), this array would contain two <b>CRYPT_INTERFACE_REG</b> structure pointers, one for the cipher interface and one for the hash interface.
     */
    rgpInterfaces : IntPtr

}
