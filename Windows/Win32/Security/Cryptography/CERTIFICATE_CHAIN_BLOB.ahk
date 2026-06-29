#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERTIFICATE_CHAIN_BLOB {
    #StructPack 8

    certCount : UInt32

    rawCertificates : CRYPT_INTEGER_BLOB.Ptr

}
