#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Contains a set of cryptographic functions for a CNG configuration context.
 * @see https://learn.microsoft.com/windows/win32/api/bcrypt/ns-bcrypt-crypt_context_functions
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_CONTEXT_FUNCTIONS {
    #StructPack 8

    /**
     * The number of elements in the <b>rgpszFunctions</b> array.
     */
    cFunctions : UInt32

    /**
     * An array of pointers to null-terminated Unicode strings that contain the identifiers of the cryptographic functions contained in this set. The <b>cFunctions</b> member contains the number of elements in this array.
     */
    rgpszFunctions : PWSTR.Ptr

}
