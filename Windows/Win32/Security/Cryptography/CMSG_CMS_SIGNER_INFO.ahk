#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_ATTRIBUTES.ahk" { CRYPT_ATTRIBUTES }
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import ".\CERT_ID_OPTION.ahk" { CERT_ID_OPTION }
#Import ".\CERT_ISSUER_SERIAL_NUMBER.ahk" { CERT_ISSUER_SERIAL_NUMBER }
#Import ".\CRYPT_ALGORITHM_IDENTIFIER.ahk" { CRYPT_ALGORITHM_IDENTIFIER }
#Import ".\CRYPT_ATTRIBUTE.ahk" { CRYPT_ATTRIBUTE }
#Import ".\CERT_ID.ahk" { CERT_ID }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Contains the content of the defined SignerInfo in signed or signed and enveloped messages.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cmsg_cms_signer_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CMSG_CMS_SIGNER_INFO {
    #StructPack 8

    /**
     * The version of this structure.
     */
    dwVersion : UInt32

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_id">CERT_ID</a> structure that identifies the signer's certificate.
     */
    SignerId : CERT_ID

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> structure that specifies the algorithm used in generating the hash of a message.
     */
    HashAlgorithm : CRYPT_ALGORITHM_IDENTIFIER

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> structure that specifies the algorithm used to encrypt the hash.
     */
    HashEncryptionAlgorithm : CRYPT_ALGORITHM_IDENTIFIER

    /**
     * A
     * 						<a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DATA_BLOB</a> structure that contains the encrypted hash of the message, the signature.
     */
    EncryptedHash : CRYPT_INTEGER_BLOB

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_attributes">CRYPT_ATTRIBUTES</a> structure that contains authenticated attributes of the signer.
     */
    AuthAttrs : CRYPT_ATTRIBUTES

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_attributes">CRYPT_ATTRIBUTES</a> structure that contains unauthenticated attributes of the signer.
     */
    UnauthAttrs : CRYPT_ATTRIBUTES

}
