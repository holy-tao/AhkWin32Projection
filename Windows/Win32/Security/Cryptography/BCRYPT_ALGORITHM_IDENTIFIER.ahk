#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Is used with the BCryptEnumAlgorithms function to contain a cryptographic algorithm identifier.
 * @see https://learn.microsoft.com/windows/win32/api/bcrypt/ns-bcrypt-bcrypt_algorithm_identifier
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct BCRYPT_ALGORITHM_IDENTIFIER {
    #StructPack 8

    /**
     * A pointer to a null-terminated Unicode string that contains the string identifier of the algorithm. The <a href="https://docs.microsoft.com/windows/desktop/SecCNG/cng-algorithm-identifiers">CNG Algorithm Identifiers</a> topic contains the predefined algorithm identifiers.
     */
    pszName : PWSTR

    /**
     * Specifies the class of the algorithm. This can be one of the <a href="https://docs.microsoft.com/windows/desktop/SecCNG/cng-interface-identifiers">CNG Interface Identifiers</a>.
     */
    dwClass : UInt32

    /**
     * A set of flags that specify other information about the algorithm. There are currently no flags defined for this member.
     */
    dwFlags : UInt32

}
