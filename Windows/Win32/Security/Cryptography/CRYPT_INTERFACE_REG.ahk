#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\BCRYPT_TABLE.ahk" { BCRYPT_TABLE }
#Import ".\BCRYPT_INTERFACE.ahk" { BCRYPT_INTERFACE }

/**
 * Used to contain information about the type of interface supported by a CNG provider.
 * @see https://learn.microsoft.com/windows/win32/api/bcrypt/ns-bcrypt-crypt_interface_reg
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_INTERFACE_REG {
    #StructPack 8

    dwInterface : BCRYPT_INTERFACE

    dwFlags : BCRYPT_TABLE

    /**
     * Contains the number of elements in the <b>rgpszFunctions</b> array.
     */
    cFunctions : UInt32

    /**
     * An array of null-terminated Unicode strings that contains the identifiers of the algorithms that are supported by this interface. These identifiers can be the standard <a href="https://docs.microsoft.com/windows/desktop/SecCNG/cng-algorithm-identifiers">CNG Algorithm Identifiers</a> or the identifiers for other registered algorithms.
     */
    rgpszFunctions : PWSTR.Ptr

}
