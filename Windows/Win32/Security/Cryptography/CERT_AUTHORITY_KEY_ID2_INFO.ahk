#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CERT_ALT_NAME_ENTRY.ahk" { CERT_ALT_NAME_ENTRY }
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import ".\CERT_ALT_NAME_INFO.ahk" { CERT_ALT_NAME_INFO }

/**
 * The CERT_AUTHORITY_KEY_ID2_INFO structure identifies the key used to sign a certificate or CRL.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_authority_key_id2_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_AUTHORITY_KEY_ID2_INFO {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DATA_BLOB</a> structure that contains a unique identifier of a public key.
     */
    KeyId : CRYPT_INTEGER_BLOB

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_alt_name_info">CERT_ALT_NAME_INFO</a> that includes the encoded name of the CA that issued the certificate. The <b>cAltEntry</b> member of the structure may be set to zero if the name is not to be used to identify the CA.
     */
    AuthorityCertIssuer : CERT_ALT_NAME_INFO

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_INTEGER_BLOB</a> structure that includes the serial number of the certificate associated with the private key used to sign this certificate. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_info">CERT_INFO</a>.
     */
    AuthorityCertSerialNumber : CRYPT_INTEGER_BLOB

}
