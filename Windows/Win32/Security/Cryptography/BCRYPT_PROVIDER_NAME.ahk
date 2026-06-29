#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Contains the name of a CNG provider.
 * @see https://learn.microsoft.com/windows/win32/api/bcrypt/ns-bcrypt-bcrypt_provider_name
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct BCRYPT_PROVIDER_NAME {
    #StructPack 8

    /**
     * A pointer to a null-terminated Unicode string that contains the name of the provider.
     */
    pszProviderName : PWSTR

}
