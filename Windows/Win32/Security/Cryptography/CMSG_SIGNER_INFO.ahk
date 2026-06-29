#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_ATTRIBUTE.ahk" { CRYPT_ATTRIBUTE }
#Import ".\CRYPT_ATTRIBUTES.ahk" { CRYPT_ATTRIBUTES }
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import ".\CRYPT_ALGORITHM_IDENTIFIER.ahk" { CRYPT_ALGORITHM_IDENTIFIER }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * The CMSG_SIGNER_INFO structure contains the content of the PKCS
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cmsg_signer_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CMSG_SIGNER_INFO {
    #StructPack 8

    /**
     * The version of this structure.
     */
    dwVersion : UInt32

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CERT_NAME_BLOB</a> structure that contains the issuer of a certificate with the public key needed to verify a signature.
     */
    Issuer : CRYPT_INTEGER_BLOB

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_INTEGER_BLOB</a> structure that contains the serial number of the certificate that contains the public key needed to verify a signature. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_info">CERT_INFO</a>.
     */
    SerialNumber : CRYPT_INTEGER_BLOB

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> structure specifying the algorithm used in generating the hash of a message.
     */
    HashAlgorithm : CRYPT_ALGORITHM_IDENTIFIER

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> structure specifying the algorithm used to encrypt the hash.
     */
    HashEncryptionAlgorithm : CRYPT_ALGORITHM_IDENTIFIER

    /**
     * A
     * 						<a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DATA_BLOB</a> that contains the encrypted hash of the message, the signature.
     */
    EncryptedHash : CRYPT_INTEGER_BLOB

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_attributes">CRYPT_ATTRIBUTES</a> structure containing authenticated attributes of the signer.
     */
    AuthAttrs : CRYPT_ATTRIBUTES

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_attributes">CRYPT_ATTRIBUTES</a> structure containing unauthenticated attributes of the signer.
     */
    UnauthAttrs : CRYPT_ATTRIBUTES

}
