#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import ".\CRYPT_ALGORITHM_IDENTIFIER.ahk" { CRYPT_ALGORITHM_IDENTIFIER }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CPS_URLS {
    #StructPack 8

    pszURL : PWSTR

    pAlgorithm : CRYPT_ALGORITHM_IDENTIFIER.Ptr

    pDigest : CRYPT_INTEGER_BLOB.Ptr

}
