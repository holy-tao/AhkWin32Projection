#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\CRYPT_ALGORITHM_IDENTIFIER.ahk" { CRYPT_ALGORITHM_IDENTIFIER }
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_HASH_INFO {
    #StructPack 8

    HashAlgorithm : CRYPT_ALGORITHM_IDENTIFIER

    Hash : CRYPT_INTEGER_BLOB

}
