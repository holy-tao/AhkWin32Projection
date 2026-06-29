#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NCRYPT_OPERATION.ahk" { NCRYPT_OPERATION }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\NCRYPT_ALGORITHM_NAME_CLASS.ahk" { NCRYPT_ALGORITHM_NAME_CLASS }

/**
 * Used to contain information about a CNG algorithm.
 * @see https://learn.microsoft.com/windows/win32/api/ncrypt/ns-ncrypt-ncryptalgorithmname
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct NCryptAlgorithmName {
    #StructPack 8

    /**
     * A pointer to a null-terminated Unicode string that contains the name of the algorithm. This can be one of the standard <a href="https://docs.microsoft.com/windows/desktop/SecCNG/cng-algorithm-identifiers">CNG Algorithm Identifiers</a> or the identifier for another registered algorithm.
     */
    pszName : PWSTR

    dwClass : NCRYPT_ALGORITHM_NAME_CLASS

    dwAlgOperations : NCRYPT_OPERATION

    /**
     * A set of flags that provide more information about the algorithm.
     */
    dwFlags : UInt32

}
