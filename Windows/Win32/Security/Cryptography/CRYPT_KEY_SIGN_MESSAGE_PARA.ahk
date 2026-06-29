#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CERT_KEY_SPEC.ahk" { CERT_KEY_SPEC }
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import ".\CERT_QUERY_ENCODING_TYPE.ahk" { CERT_QUERY_ENCODING_TYPE }
#Import ".\NCRYPT_KEY_HANDLE.ahk" { NCRYPT_KEY_HANDLE }
#Import ".\CRYPT_ALGORITHM_IDENTIFIER.ahk" { CRYPT_ALGORITHM_IDENTIFIER }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Contains information about the cryptographic service provider (CSP) and algorithms used to sign a message.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-crypt_key_sign_message_para
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_KEY_SIGN_MESSAGE_PARA {
    #StructPack 8

    /**
     * The size, in bytes, of this data structure.
     */
    cbSize : UInt32 := this.Size

    dwMsgAndCertEncodingType : CERT_QUERY_ENCODING_TYPE

    hCryptProv : IntPtr

    dwKeySpec : CERT_KEY_SPEC

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> structure that specifies the algorithm to use to generate the hash of the message. This must be a hash algorithm.
     */
    HashAlgorithm : CRYPT_ALGORITHM_IDENTIFIER

    /**
     * This member is not used and must be set to <b>NULL</b>.
     */
    pvHashAuxInfo : IntPtr

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> structure that specifies the algorithm to use to sign the message. This must be either a public key or a signature algorithm.
     */
    PubKeyAlgorithm : CRYPT_ALGORITHM_IDENTIFIER

    static __New() {
        DefineProp(this.Prototype, 'hNCryptKey', { type: NCRYPT_KEY_HANDLE, offset: 8 })
        this.DeleteProp("__New")
    }
}
