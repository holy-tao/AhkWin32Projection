#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CERT_ALT_NAME_ENTRY.ahk" { CERT_ALT_NAME_ENTRY }
#Import ".\OCSP_REQUEST_ENTRY.ahk" { OCSP_REQUEST_ENTRY }
#Import ".\CERT_EXTENSION.ahk" { CERT_EXTENSION }

/**
 * Contains information for an online certificate status protocol (OCSP) request as specified by RFC 2560.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-ocsp_request_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct OCSP_REQUEST_INFO {
    #StructPack 8

    /**
     * A value that indicates the protocol version of the OCSP request.
     */
    dwVersion : UInt32

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_alt_name_entry">CERT_ALT_NAME_ENTRY</a> structure that contains the name bound to the certificate <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">public key</a> of the requester.
     */
    pRequestorName : CERT_ALT_NAME_ENTRY.Ptr

    /**
     * The number of elements in the <b>rgRequestEntry</b> array.
     */
    cRequestEntry : UInt32

    /**
     * An array of pointers to <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-ocsp_request_entry">OCSP_REQUEST_ENTRY</a> structures.
     */
    rgRequestEntry : OCSP_REQUEST_ENTRY.Ptr

    /**
     * The number of elements in the <b>rgExtension</b> array.
     */
    cExtension : UInt32

    /**
     * An array of pointers to <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_extension">CERT_EXTENSION</a> structures, each of which contains information about the request.
     */
    rgExtension : CERT_EXTENSION.Ptr

}
