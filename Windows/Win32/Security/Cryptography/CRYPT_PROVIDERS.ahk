#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Contains information about the registered CNG providers.
 * @see https://learn.microsoft.com/windows/win32/api/bcrypt/ns-bcrypt-crypt_providers
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_PROVIDERS {
    #StructPack 8

    /**
     * Contains the number of elements in the <b>rgpszProviders</b> array.
     */
    cProviders : UInt32

    /**
     * An array of null-terminated Unicode strings that contains the names of the registered providers.
     */
    rgpszProviders : PWSTR.Ptr

}
