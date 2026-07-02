#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import ".\CRYPT_BIT_BLOB.ahk" { CRYPT_BIT_BLOB }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_ECC_PRIVATE_KEY_INFO {
    #StructPack 8

    dwVersion : UInt32

    PrivateKey : CRYPT_INTEGER_BLOB

    szCurveOid : PSTR

    PublicKey : CRYPT_BIT_BLOB

}
