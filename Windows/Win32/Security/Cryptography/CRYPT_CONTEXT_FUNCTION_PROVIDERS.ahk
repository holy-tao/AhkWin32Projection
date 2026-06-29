#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Contains a set of cryptographic function providers for a CNG configuration context.
 * @see https://learn.microsoft.com/windows/win32/api/bcrypt/ns-bcrypt-crypt_context_function_providers
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_CONTEXT_FUNCTION_PROVIDERS {
    #StructPack 8

    /**
     * The number of elements in the <b>rgpszProviders</b> array.
     */
    cProviders : UInt32

    /**
     * An array of pointers to null-terminated Unicode strings that contain the identifiers of the function providers contained in this set. The <b>cProviders</b> member contains the number of elements in this array.
     */
    rgpszProviders : PWSTR.Ptr

}
