#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import ".\CRYPT_ALGORITHM_IDENTIFIER.ahk" { CRYPT_ALGORITHM_IDENTIFIER }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Contains information to identify a certificate in an online certificate status protocol (OCSP) request or response.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-ocsp_cert_id
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct OCSP_CERT_ID {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> structure that specifies the algorithm used to create <i>IssuerNameHash</i> and <i>IssuerKeyHash</i>.
     */
    HashAlgorithm : CRYPT_ALGORITHM_IDENTIFIER

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_HASH_BLOB</a> that contains a hash of the certificate issuer subject name.
     */
    IssuerNameHash : CRYPT_INTEGER_BLOB

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_HASH_BLOB</a> that contains a hash of the certificate issuer public key.
     */
    IssuerKeyHash : CRYPT_INTEGER_BLOB

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/SecGloss/b-gly">BLOB</a> that contains the serial number of the certificate. For more information, see the <b>SerialNumber</b> member description for <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_info">CERT_INFO</a>.
     */
    SerialNumber : CRYPT_INTEGER_BLOB

}
