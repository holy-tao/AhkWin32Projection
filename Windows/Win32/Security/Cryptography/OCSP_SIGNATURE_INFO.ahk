#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import ".\CRYPT_ALGORITHM_IDENTIFIER.ahk" { CRYPT_ALGORITHM_IDENTIFIER }
#Import ".\CRYPT_BIT_BLOB.ahk" { CRYPT_BIT_BLOB }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Contains a signature for an online certificate status protocol (OCSP) request or response.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-ocsp_signature_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct OCSP_SIGNATURE_INFO {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> structure that specifies the algorithm used to create the <b>Signature</b>.
     */
    SignatureAlgorithm : CRYPT_ALGORITHM_IDENTIFIER

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/SecGloss/b-gly">BLOB</a> that contains a signed hash of an <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-ocsp_request_info">OCSP_REQUEST_INFO</a> or <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-ocsp_basic_response_info">OCSP_BASIC_RESPONSE_INFO</a> structure.
     */
    Signature : CRYPT_BIT_BLOB

    /**
     * The number of elements in the <b>rgCertEncoded</b> array.
     */
    cCertEncoded : UInt32

    /**
     * An array of pointers to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CERT_BLOB</a> structures, each of which contains an encoded signature certificate.
     */
    rgCertEncoded : CRYPT_INTEGER_BLOB.Ptr

}
