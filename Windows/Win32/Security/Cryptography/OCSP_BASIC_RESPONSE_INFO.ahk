#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CERT_EXTENSION.ahk" { CERT_EXTENSION }
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import ".\OCSP_BASIC_RESPONSE_ENTRY.ahk" { OCSP_BASIC_RESPONSE_ENTRY }

/**
 * Contains a basic online certificate status protocol (OCSP) response as specified by RFC 2560.
 * @remarks
 * OCSP responder applications encode this structure and store it in an <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-ocsp_basic_signed_response_info">OCSP_BASIC_SIGNED_RESPONSE_INFO</a> <b>ToBeSigned</b> member. Conversely, OCSP client applications decode the <b>OCSP_BASIC_SIGNED_RESPONSE_INFO</b> structure to obtain this structure.
 * 
 * OCSP applications can encode or decode this structure by using <b>X509_ASN_ENCODING</b> or <b>PKCS_7_ASN_ENCODING</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-ocsp_basic_response_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct OCSP_BASIC_RESPONSE_INFO {
    #StructPack 8

    /**
     * A value that indicates the protocol version of the response.
     */
    dwVersion : UInt32

    /**
     * A value that indicates the type of ID the responder used in this response.
     */
    dwResponderIdChoice : UInt32

    ByNameResponderId : CRYPT_INTEGER_BLOB

    /**
     * The date and time at which the response was signed.
     */
    ProducedAt : FILETIME

    /**
     * The number of elements in the <i>rgResponseEntry</i> array.
     */
    cResponseEntry : UInt32

    /**
     * An array of pointers to <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-ocsp_basic_response_entry">OCSP_BASIC_RESPONSE_ENTRY</a> structures, each of which contains a certificate status.
     */
    rgResponseEntry : OCSP_BASIC_RESPONSE_ENTRY.Ptr

    /**
     * The number of elements in the <b>rgExtension</b> array.
     */
    cExtension : UInt32

    /**
     * An array of pointers to <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_extension">CERT_EXTENSION</a> structures, each of which contains additional information about the response.
     */
    rgExtension : CERT_EXTENSION.Ptr

    static __New() {
        DefineProp(this.Prototype, 'ByKeyResponderId', { type: CRYPT_INTEGER_BLOB, offset: 8 })
        this.DeleteProp("__New")
    }
}
