#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Stores the certificate request context.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-sec_certificate_request_context
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SEC_CERTIFICATE_REQUEST_CONTEXT {
    #StructPack 1

    /**
     * The size (in bytes) of the **rgCertificateRequestContext** array.
     */
    cbCertificateRequestContext : Int8

    /**
     * The TLS 1.3 certificate request context.
     */
    rgCertificateRequestContext : Int8[1]

}
