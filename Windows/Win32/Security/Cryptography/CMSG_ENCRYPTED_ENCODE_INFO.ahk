#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import ".\CRYPT_ALGORITHM_IDENTIFIER.ahk" { CRYPT_ALGORITHM_IDENTIFIER }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CMSG_ENCRYPTED_ENCODE_INFO {
    #StructPack 8

    cbSize : UInt32 := this.Size

    ContentEncryptionAlgorithm : CRYPT_ALGORITHM_IDENTIFIER

    pvEncryptionAuxInfo : IntPtr

}
