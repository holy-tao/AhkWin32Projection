#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CERT_EXTENSION.ahk" { CERT_EXTENSION }
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import ".\CRYPT_ALGORITHM_IDENTIFIER.ahk" { CRYPT_ALGORITHM_IDENTIFIER }
#Import ".\OCSP_CERT_ID.ahk" { OCSP_CERT_ID }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Contains information about a single certificate in an online certificate status protocol (OCSP) request.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-ocsp_request_entry
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct OCSP_REQUEST_ENTRY {
    #StructPack 8

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-ocsp_cert_id">OCSP_CERT_ID</a> structure that specifies the target certificate.
     */
    CertId : OCSP_CERT_ID

    /**
     * The number of elements in the <b>rgExtension</b> array.
     */
    cExtension : UInt32

    /**
     * An array of pointers to <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_extension">CERT_EXTENSION</a> structures, each of which contains information about the <b>CertId</b> certificate.
     */
    rgExtension : CERT_EXTENSION.Ptr

}
