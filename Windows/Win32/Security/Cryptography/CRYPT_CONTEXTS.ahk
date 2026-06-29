#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Contains a set of CNG configuration context identifiers.
 * @see https://learn.microsoft.com/windows/win32/api/bcrypt/ns-bcrypt-crypt_contexts
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_CONTEXTS {
    #StructPack 8

    /**
     * Contains the number of elements in the <b>rgpszContexts</b> array.
     */
    cContexts : UInt32

    /**
     * An array of pointers to null-terminated Unicode strings that contain the identifiers of the contexts contained in this set. The <b>cContext</b> member contains the number of elements in this array.
     */
    rgpszContexts : PWSTR.Ptr

}
