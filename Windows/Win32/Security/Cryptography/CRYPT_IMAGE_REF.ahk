#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\CRYPT_IMAGE_REF_FLAGS.ahk" { CRYPT_IMAGE_REF_FLAGS }

/**
 * Contains information about a CNG provider module.
 * @see https://learn.microsoft.com/windows/win32/api/bcrypt/ns-bcrypt-crypt_image_ref
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_IMAGE_REF {
    #StructPack 8

    /**
     * A pointer to a null-terminated Unicode string that contains the name of the provider module.
     */
    pszImage : PWSTR

    dwFlags : CRYPT_IMAGE_REF_FLAGS

}
