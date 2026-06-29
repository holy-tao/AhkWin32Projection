#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }

/**
 * Identifies the key used to sign a certificate or certificate revocation list (CRL).
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_authority_key_id_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_AUTHORITY_KEY_ID_INFO {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DATA_BLOB</a> structure that contains a unique identifier of a public key.
     */
    KeyId : CRYPT_INTEGER_BLOB

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CERT_NAME_BLOB</a> structure that contains the encoded distinguished name of the certification authority that issued the certificate.
     */
    CertIssuer : CRYPT_INTEGER_BLOB

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_INTEGER_BLOB</a> structure that contains the serial number of the certificate associated with the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">private key</a> used to sign this certificate. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_info">CERT_INFO</a>.
     */
    CertSerialNumber : CRYPT_INTEGER_BLOB

}
