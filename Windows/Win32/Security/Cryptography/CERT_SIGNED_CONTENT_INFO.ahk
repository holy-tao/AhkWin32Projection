#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import ".\CRYPT_ALGORITHM_IDENTIFIER.ahk" { CRYPT_ALGORITHM_IDENTIFIER }
#Import ".\CRYPT_BIT_BLOB.ahk" { CRYPT_BIT_BLOB }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * The CERT_SIGNED_CONTENT_INFO structure contains encoded content to be signed and a BLOB to hold the signature. The ToBeSigned member is an encoded CERT_INFO, CRL_INFO, CTL_INFO or CERT_REQUEST_INFO.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_signed_content_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_SIGNED_CONTENT_INFO {
    #StructPack 8

    /**
     * A BLOB that has been encoded by using <a href="https://docs.microsoft.com/windows/desktop/SecGloss/d-gly">Distinguished Encoding Rules</a> (DER) and that is to be signed.
     */
    ToBeSigned : CRYPT_INTEGER_BLOB

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> structure that contains the signature algorithm type and any associated additional parameters.
     */
    SignatureAlgorithm : CRYPT_ALGORITHM_IDENTIFIER

    /**
     * BLOB containing a signed <a href="https://docs.microsoft.com/windows/desktop/SecGloss/h-gly">hash</a> of the encoded data.
     */
    Signature : CRYPT_BIT_BLOB

}
