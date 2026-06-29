#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HCRYPTPROV_LEGACY.ahk" { HCRYPTPROV_LEGACY }
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import ".\CRYPT_ALGORITHM_IDENTIFIER.ahk" { CRYPT_ALGORITHM_IDENTIFIER }
#Import ".\CMSG_ENVELOPED_ENCODE_INFO.ahk" { CMSG_ENVELOPED_ENCODE_INFO }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\CMSG_SIGNED_ENCODE_INFO.ahk" { CMSG_SIGNED_ENCODE_INFO }
#Import ".\CMSG_SIGNER_ENCODE_INFO.ahk" { CMSG_SIGNER_ENCODE_INFO }
#Import ".\CERT_INFO.ahk" { CERT_INFO }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CMSG_SIGNED_AND_ENVELOPED_ENCODE_INFO {
    #StructPack 8

    cbSize : UInt32 := this.Size

    SignedInfo : CMSG_SIGNED_ENCODE_INFO

    EnvelopedInfo : CMSG_ENVELOPED_ENCODE_INFO

}
