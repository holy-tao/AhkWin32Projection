#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct ENDPOINTADDRESS {
    #StructPack 8

    serviceUrl : PWSTR

    policyUrl : PWSTR

    rawCertificate : CRYPT_INTEGER_BLOB

}
