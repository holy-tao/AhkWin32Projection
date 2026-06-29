#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\OCSP_SIGNATURE_INFO.ahk" { OCSP_SIGNATURE_INFO }
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }

/**
 * Contains information for an online certificate status protocol (OCSP) request with optional signature information.
 * @remarks
 * In an OCSP client application, this structure receives an encoded <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-ocsp_request_info">OCSP_REQUEST_INFO</a> structure as its <b>ToBeSigned</b> member. Optionally, a signature  of the <b>ToBeSigned</b>  member is stored in the <b>pOptionalSignatureInfo</b> member.
 * 
 * On the receiving end, an OCSP responder application decodes the incoming request to populate an <b>OCSP_SIGNED_REQUEST_INFO</b> structure and subsequently decodes the <b>ToBeSigned</b> member to obtain an <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-ocsp_request_info">OCSP_REQUEST_INFO</a> structure.
 * 
 * OCSP applications can encode or decode this structure by using <b>X509_ASN_ENCODING</b> or <b>PKCS_7_ASN_ENCODING</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-ocsp_signed_request_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct OCSP_SIGNED_REQUEST_INFO {
    #StructPack 8

    /**
     * A BLOB that has been encoded by using <a href="https://docs.microsoft.com/windows/desktop/SecGloss/d-gly">Distinguished Encoding Rules</a> (DER) and that contains the OCSP request information.
     */
    ToBeSigned : CRYPT_INTEGER_BLOB

    /**
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-ocsp_signature_info">OCSP_SIGNATURE_INFO</a> structure that contains optional signature information.
     */
    pOptionalSignatureInfo : OCSP_SIGNATURE_INFO.Ptr

}
