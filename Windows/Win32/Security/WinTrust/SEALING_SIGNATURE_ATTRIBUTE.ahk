#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Cryptography\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import "..\Cryptography\CRYPT_ALGORITHM_IDENTIFIER.ahk" { CRYPT_ALGORITHM_IDENTIFIER }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.Security.WinTrust
 */
export default struct SEALING_SIGNATURE_ATTRIBUTE {
    #StructPack 8

    version : UInt32

    signerIndex : UInt32

    signatureAlgorithm : CRYPT_ALGORITHM_IDENTIFIER

    encryptedDigest : CRYPT_INTEGER_BLOB

}
