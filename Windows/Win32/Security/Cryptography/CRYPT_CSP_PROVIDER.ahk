#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\CRYPT_BIT_BLOB.ahk" { CRYPT_BIT_BLOB }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_CSP_PROVIDER {
    #StructPack 8

    dwKeySpec : UInt32

    pwszProviderName : PWSTR

    Signature : CRYPT_BIT_BLOB

}
