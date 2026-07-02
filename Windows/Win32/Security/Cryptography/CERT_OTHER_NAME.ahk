#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_OTHER_NAME {
    #StructPack 8

    pszObjId : PSTR

    Value : CRYPT_INTEGER_BLOB

}
