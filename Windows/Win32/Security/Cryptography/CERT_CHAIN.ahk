#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\CRYPT_KEY_PROV_INFO.ahk" { CRYPT_KEY_PROV_INFO }
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import ".\CRYPT_KEY_PROV_PARAM.ahk" { CRYPT_KEY_PROV_PARAM }
#Import ".\CRYPT_KEY_FLAGS.ahk" { CRYPT_KEY_FLAGS }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_CHAIN {
    #StructPack 8

    cCerts : UInt32

    certs : CRYPT_INTEGER_BLOB.Ptr

    keyLocatorInfo : CRYPT_KEY_PROV_INFO

}
