#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_PROPERTY_REF.ahk" { CRYPT_PROPERTY_REF }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\CRYPT_IMAGE_REF.ahk" { CRYPT_IMAGE_REF }

/**
 * Contains information about a cryptographic interface that a provider supports.
 * @see https://learn.microsoft.com/windows/win32/api/bcrypt/ns-bcrypt-crypt_provider_ref
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_PROVIDER_REF {
    #StructPack 8

    /**
     * The identifier of the interface that this reference applies to. This will be one of the <a href="https://docs.microsoft.com/windows/desktop/SecCNG/cng-interface-identifiers">CNG Interface Identifiers</a>.
     */
    dwInterface : UInt32

    /**
     * A pointer to a null-terminated Unicode string that identifies the algorithm or function that the reference applies to. This can be one of the standard <a href="https://docs.microsoft.com/windows/desktop/SecCNG/cng-algorithm-identifiers">CNG Algorithm Identifiers</a> or the identifier for another registered algorithm.
     */
    pszFunction : PWSTR

    /**
     * A pointer to a null-terminated Unicode string that contains the name of the provider.
     */
    pszProvider : PWSTR

    /**
     * The number of elements in the <b>rgpProperties</b> array. If the algorithm or function has no properties, then this member will be zero.
     */
    cProperties : UInt32

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/bcrypt/ns-bcrypt-crypt_property_ref">CRYPT_PROPERTY_REF</a> structure pointers that contain the properties for this algorithm or function. The <b>cProperties</b> member contains the number of elements in this array.
     */
    rgpProperties : IntPtr

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/bcrypt/ns-bcrypt-crypt_image_ref">CRYPT_IMAGE_REF</a> structure that contains information about the user mode provider module. If this information was not requested or the provider is not registered as a user mode provider, this member will be <b>NULL</b>.
     */
    pUM : CRYPT_IMAGE_REF.Ptr

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/bcrypt/ns-bcrypt-crypt_image_ref">CRYPT_IMAGE_REF</a> structure that contains information about the kernel mode provider module. If this information was not requested or the provider is not registered as a kernel mode provider, this member will be <b>NULL</b>.
     */
    pKM : CRYPT_IMAGE_REF.Ptr

}
