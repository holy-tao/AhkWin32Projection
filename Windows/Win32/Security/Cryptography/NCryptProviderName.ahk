#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Used to contain the name of a CNG key storage provider.
 * @see https://learn.microsoft.com/windows/win32/api/ncrypt/ns-ncrypt-ncryptprovidername
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct NCryptProviderName {
    #StructPack 8

    /**
     * A pointer to a null-terminated Unicode string that contains the name of the provider.
     */
    pszName : PWSTR

    /**
     * A pointer to a null-terminated Unicode string that contains optional text for the provider.
     */
    pszComment : PWSTR

}
