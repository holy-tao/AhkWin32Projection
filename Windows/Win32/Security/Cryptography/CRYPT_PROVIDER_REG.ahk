#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\CRYPT_IMAGE_REG.ahk" { CRYPT_IMAGE_REG }

/**
 * Used to contain registration information for a CNG provider.
 * @see https://learn.microsoft.com/windows/win32/api/bcrypt/ns-bcrypt-crypt_provider_reg
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_PROVIDER_REG {
    #StructPack 8

    /**
     * Contains the number of elements in the <b>rgpszAliases</b> array. If the provider has no aliases, this member will be zero and the <b>rgpszAliases</b> member will be <b>NULL</b>.
     */
    cAliases : UInt32

    /**
     * An array of null-terminated Unicode strings that contains the aliases of the provider. If the provider has no aliases, this member will contain <b>NULL</b> and the <b>cAliases</b> member will contain zero.
     */
    rgpszAliases : PWSTR.Ptr

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/bcrypt/ns-bcrypt-crypt_image_reg">CRYPT_IMAGE_REG</a> structure that contains the registration information for the user mode provider. If this member is <b>NULL</b>, the provider is not registered for user mode.
     */
    pUM : CRYPT_IMAGE_REG.Ptr

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/bcrypt/ns-bcrypt-crypt_image_reg">CRYPT_IMAGE_REG</a> structure that contains the registration information for the kernel mode provider. If this member is <b>NULL</b>, the provider is not registered for kernel mode.
     */
    pKM : CRYPT_IMAGE_REG.Ptr

}
